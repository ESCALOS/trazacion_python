from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login,authenticate,logout
from django.db import IntegrityError
from django.db.models import Sum,Count
from .models import Pallet,DetallePallet,Presentacion,Variedad,Calibre,Categoria
from django.http import JsonResponse
from django.template.loader import render_to_string
from django.conf import settings
from django.utils.datastructures import MultiValueDictKeyError
import json

def autenticacion(request):
    if request.method == "GET":
        if not request.user.is_authenticated:
            return render(request, 'login.html',{
                'form' : UserCreationForm
            })
        else:
            if request.user.rol == "ENC":
                return redirect('detalle')
            elif request.user.rol == "REG":
                return redirect('index')
            elif request.user.rol == "EMB":
                return redirect('embarque')
            else:
                cerrarSesion(request)
    else:
        try:
            user = authenticate(username=request.POST['user'], password=request.POST['password'])
            if user is not None:    
                login(request,user)
                if request.user.rol == "ENC":
                    return redirect('detalle')
                elif request.user.rol == "REG":
                    return redirect('index')
                elif request.user.rol == "EMB":
                    return redirect('embarque')
                else:
                    cerrarSesion(request)
            else:
                return render(request, 'login.html',{
                'form' : UserCreationForm,
                'error' : 'Contraseña incorrecta'
            })
        except IntegrityError:
            return render(request, 'login.html',{
                'form' : UserCreationForm,
                'error' : 'El usuario ya existe'
            })
def cerrarSesion(request):
    logout(request)
    return redirect('login')
def index(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    elif request.user.rol == "EMB":
        return redirect('embarque')
    elif request.user.rol == "REG" or request.user.rol == "ENC":
        pallets = Pallet.objects.all()
        presentaciones = Presentacion.objects.values('id','presentacion')
        variedades = Variedad.objects.values('id','variedad')
        calibres = Calibre.objects.values('id','calibre')
        categorias = Categoria.objects.values('id','categoria')
        return render(request, 'index.html',{
            'pallets':pallets,
            'presentaciones': presentaciones,
            'variedades' : variedades,
            'calibres' : calibres,
            'categorias' : categorias,
        })
    else:
        cerrarSesion(request)
def tablaPallet(request):
    data = dict()
    pallets = Pallet.objects.filter(embarcado=False).order_by('-updated_at')
    context = {
        'pallets':pallets
    }
    data['tabla'] = render_to_string('tabla_pallet.html',context,request=request)
    return JsonResponse(data)
def datosPallet(request):
    if request.user.is_authenticated:
        try:
            pallet = Pallet.objects.values_list('codigo','dp','presentacion','variedad','calibre','categoria','plu','cantidad_de_cajas',named=True).get(codigo=request.GET['codigo'])
            detalle = DetallePallet.objects.filter(pallet__codigo = request.GET['codigo']).values('numero_de_guia','numero_de_cajas','lote')
            data = {
                'success': True,
                'pallet': pallet,
                'detalle': list(detalle),
                'message': 'Pallet encontrado'
            }
        except Pallet.DoesNotExist:
            data = {
                'success': False,
                'message': "Registre el pallet",
            }
        except Exception as e:
            data = {
                'success' : False,
                'message' : e
            }
    else:
        data = {'success': 'No identificado'}
        
    return JsonResponse(data, safe=False)
def registrarPallet(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            if request.POST['presentacion'] == "":
                 presentacion_post = "0";
            else:
                presentacion_post = request.POST['presentacion']
                
            if request.POST['variedad'] == "":
                 variedad_post = "0"
            else:
                variedad_post = request.POST['variedad']
                
            if request.POST['calibre'] == "":
                 calibre_post = "0"
            else:
                calibre_post = request.POST['calibre']
                
            if request.POST['categoria'] == "":
                 categoria_post = "0"
            else:
                categoria_post = request.POST['categoria']
                
            if request.POST['codigo'] == "":
                data = {
                    'success' : False,
                    'message' : 'Falta el código del Pallet',
                    'icon' : 'warning'
                }
            elif request.POST['dp'] == "":
                data = {
                    'success' : False,
                    'message' : 'Falta el DP',
                    'icon' : 'warning'
                }
            elif not Presentacion.objects.filter(id=int(presentacion_post)).exists():
                data = {
                    'success' : False,
                    'message' : 'Presentación incorrecta',
                    'icon' : 'warning'
                }
            elif not Variedad.objects.filter(id=int(variedad_post)).exists():
                data = {
                    'success' : False,
                    'message' : 'Falta la variedad',
                    'icon' : 'warning'
                }
            elif not Calibre.objects.filter(id=int(calibre_post)).exists():
                data = {
                    'success' : False,
                    'message' : 'Falta el calibre',
                    'icon' : 'warning'
                }
            elif not Categoria.objects.filter(id=int(categoria_post)).exists():
                data = {
                    'success' : False,
                    'message' : 'Falta el categoria',
                    'icon' : 'warning'
                }
            else:
                presentacion = Presentacion.objects.get(id=request.POST['presentacion'])
                total_cajas = 0
                detalles = json.loads(request.POST['detalles'])
                for detalle in detalles:
                    total_cajas = total_cajas + int(detalle[1])
                if(total_cajas<=presentacion.cantidad_de_cajas):
                    try:
                        pallet = Pallet.objects.get(codigo=request.POST['codigo'],embarcado=False)
                        pallet.dp = request.POST['dp']
                        pallet.calibre_id = request.POST['calibre']
                        pallet.variedad_id =request.POST['variedad']
                        pallet.presentacion_id = request.POST['presentacion']
                        pallet.categoria_id = request.POST['categoria']
                        pallet.plu = eval(request.POST['plu'].capitalize())
                        pallet.cantidad_de_cajas = presentacion.cantidad_de_cajas
                        pallet.save()
                        DetallePallet.objects.filter(pallet=pallet).delete()
                        for detalle in detalles:
                            DetallePallet.objects.create(
                                numero_de_guia=detalle[0],
                                numero_de_cajas=detalle[1],
                                lote=detalle[2],
                                pallet_id=pallet.pk,
                                usuario_id=request.user.id
                            )                
                        data =  {
                            'success': True,
                            'message': 'Se actualizó el pallet con éxito',
                            'icon' : 'success'
                        }
                    except Pallet.DoesNotExist:
                        pallet = Pallet(
                            codigo = request.POST['codigo'],
                            dp = request.POST['dp'],
                            planta_id = request.user.planta_id,
                            calibre_id = request.POST['calibre'],
                            variedad_id = request.POST['variedad'],
                            presentacion_id = request.POST['presentacion'],
                            categoria_id = request.POST['categoria'],
                            plu = eval(request.POST['plu'].capitalize()),
                            completo = False,
                            cantidad_de_cajas = presentacion.cantidad_de_cajas
                        )
                        pallet.save()
                        DetallePallet.objects.filter(pallet=pallet).delete()
                        for detalle in detalles:
                            DetallePallet.objects.create(
                                numero_de_guia=detalle[0],
                                numero_de_cajas=detalle[1],
                                lote=detalle[2],
                                pallet_id=pallet.pk,
                                usuario_id=request.user.id
                            )
                        data = {
                            'success':True,
                            'message':'Se creó el pallet con éxito',
                            'icon' : 'success'
                        }
                    except Exception as e:
                        data = {
                            'success' : False,
                            'message' : e,
                            'icon' : 'error'
                        }
                else:
                    excedente = total_cajas-presentacion.cantidad_de_cajas
                    if excedente == 1:
                        mensaje = "Hay una caja de más"
                    else:
                        mensaje = "Hay " + str(excedente) + ' cajas de más'
                        
                    data = {
                        'success' : False,
                        'message' : mensaje,
                        'icon' : 'warning'
                    }
                
            return JsonResponse(data, safe=False)
        else:
            return redirect('login')
    else:
        data = {
            'success': False,
            'message': 'No identificado'
        }
    return JsonResponse(data, safe=False)
def cantidadCajas(request):
    if request.user.is_authenticated:
        try:
            if(request.GET['codigo']==''):
                cantidad_presentacion = 0
            else:
                cantidad_de_cajas_del_pallet = DetallePallet.objects.filter(pallet__codigo=request.GET['codigo']).aggregate(cantidad_de_cajas = Sum('numero_de_cajas'))
                cantidad_presentacion = cantidad_de_cajas_del_pallet['cantidad_de_cajas']
                
            maximo_de_cajas_del_pallet = Presentacion.objects.values_list('cantidad_de_cajas').get(pk=request.GET['presentacion'])
            data = {
                'success':True,
                'message':"Pallet encontrado",
                'total_cajas':cantidad_presentacion,
                'maximo_cajas':maximo_de_cajas_del_pallet[0]
            } 
        except MultiValueDictKeyError:
            data = {
                'success' : False,
                'message' : 'Falta el codigo o presentacion del pallet',
                'total_cajas': 0,
                'maximo_cajas':0
            }
        return JsonResponse(data,safe=False) 
    else:
        return redirect('login')
def tablaDetalle(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    elif request.user.rol == "ENC":
        detalle_pallets = DetallePallet.objects.all()
        return render(request, 'detalle.html',{
            'detalle_pallets': detalle_pallets,
        })
    elif request.user.rol == "EMB":
        return redirect('embarque')
    elif request.user.rol == "REG":
        return redirect("index")
    else:
        cerrarSesion(request)
def remontabilidad(request):
    if not request.user.is_authenticated:
        return redirect('login')
    elif request.method != "GET":
        data = {
            'success' : False,
            'message' : "Ruta no disponible por Post"
        }
    elif request.GET['codigo_pallet_para_sacar'] == request.GET['codigo_pallet_para_poner']:
        data = {
            'success' : False,
            'title' : 'Código repetido',
            'message' : "No se puede hacer remontado del mismo pallet",
            'icon' : 'error'
        }
    else:
        try:
            pallet_para_sacar = Pallet.objects.get(codigo = request.GET['codigo_pallet_para_sacar'],completo=False,embarcado=False)
            pallet_para_poner = Pallet.objects.get(codigo=request.GET['codigo_pallet_para_poner'],completo=False,embarcado=False,presentacion=pallet_para_sacar.presentacion,variedad=pallet_para_sacar.variedad,calibre=pallet_para_sacar.calibre,categoria=pallet_para_sacar.categoria)
            
            cajas_puestas = DetallePallet.objects.filter(pallet=pallet_para_poner).aggregate(cajas = Sum('numero_de_cajas'))
            cajas_disponibles_para_sacar = DetallePallet.objects.filter(pallet=pallet_para_sacar).aggregate(cajas = Sum('numero_de_cajas'))
            
            cajas_necesarias_para_completar = pallet_para_poner.cantidad_de_cajas - cajas_puestas['cajas']
            if(pallet_para_poner.completo or pallet_para_sacar.completo):
                data = {
                    'success' : False,
                    'title' : 'Pallet completo',
                    'message' : 'El pallet ya está completo',
                    'icon' : 'warning'
                }
            else:
                if cajas_disponibles_para_sacar['cajas'] <= cajas_necesarias_para_completar:
                    cajas_remontadas = cajas_disponibles_para_sacar['cajas']
                else:
                    cajas_remontadas = cajas_necesarias_para_completar
                data = {
                    'success' : True,
                    'title': "Compatible",
                    'message' : "¿Desea remontar " + str(cajas_remontadas) + " cajas.",
                    'icon' : "success",
                    'cajas' : cajas_remontadas,
                    'pallet_a_sacar': pallet_para_sacar.pk,
                    'pallet_a_poner': pallet_para_poner.pk
                }
        except Pallet.DoesNotExist:
            data = {
                'success' : False,
                'message' : "Incompatible",
                'icon': "error",
            }
    return JsonResponse(data,safe=False)
def remontar(request):
    if not request.user.is_authenticated:
        return redirect('login')
    elif request.method != "POST":
        data = {
            'success'   : False,
            'title'     : "Método http insoportable",
            'message'   : "Error al enviar",
            'icon'      : 'error'
        }
    else: 
        pallet_para_poner = int(request.POST['pallet_para_poner'])
        pallet_para_sacar = int(request.POST['pallet_para_sacar'])
        cajas_a_remontar = int(request.POST['cajas'])
        try:
            pallet = Pallet.objects.get(pk=pallet_para_poner)
            detalles = DetallePallet.objects.filter(pallet=pallet_para_sacar).order_by('-id')
            for detalle in detalles:
                while cajas_a_remontar > 0:
                    if cajas_a_remontar - detalle.numero_de_cajas < 0:
                        detalle.numero_de_cajas -= cajas_a_remontar
                        DetallePallet.objects.create(
                                numero_de_guia=detalle.numero_de_guia,
                                numero_de_cajas=cajas_a_remontar,
                                lote=detalle.lote,
                                pallet_id=pallet_para_poner,
                                usuario_id=request.user.id
                            ) 
                        detalle.save()
                        cajas_a_remontar = 0
                    else:
                        cajas_a_remontar -= detalle.numero_de_cajas
                        detalle.pallet_id = pallet_para_poner
                        detalle.usuario_id = request.user.id
                        detalle.save()
                    break
            data = {
                'success'   : True,
                'title'     : "Remontado",
                'message'   : "Se remontó " + request.POST['cajas'] + " cajas",
                'icon'      : "success",
                'codigo'    : pallet.codigo,
                'presentacion': pallet.presentacion_id
            }
        except Exception as e:
            data = {
                'success'   : False,
                'message'   : str(e),
                'title'     : "¡No remontado!",
                'icon'      : "warning"   
            }
    return JsonResponse(data,safe=False)
def embarque(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    elif request.user.rol == "EMB":
        return render(request, 'embarque.html')
    elif request.user.rol == "ENC" or request.user.rol == "REG":
        return redirect('index')
    else:
        cerrarSesion(request)
def tablaEmbarque(request):
    data = dict()
    pallets = Pallet.objects.filter(completo=True)
    context = {
        'pallets':pallets
    }
    data['tabla'] = render_to_string('tabla_embarque.html',context,request=request)
    return JsonResponse(data)
def embarcar(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    elif request.method != "POST":
        data = {
            'success' : False,
            'title' : "Método no soportado",
            'icon' : "error"
        }
    else:
        try:
            pallet = Pallet.objects.get(codigo=request.POST['codigo_pallet'],completo=True)
            pallet.embarcado = not pallet.embarcado
            pallet.save()
            if(pallet.embarcado):    
                title = "¡Embarcado!"
                message = "Se embarcó el pallet correctamente",
                icon = "success"
            else:
                title = "¡Desembarcado!"
                message = "El pallet volvió a almacén",
                icon = "info"
            data = {
                    'success' : True,
                    'title': title,
                    'message': message,
                    'icon': icon
                }
        except Exception as e:
            data = {
            'success' : True,
            'title': "¡Pallet incompleto!",
            'message': "No se puede embarcar",
            'icon': "warning"
        }

    return JsonResponse(data,safe=False)
