from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login,authenticate,logout
from django.db import IntegrityError
from django.db.models import Sum,Count,Q,Value
from django.db.models.functions import Concat
from .models import Pallet,DetallePallet,Etiqueta,Variedad,Presentacion,Lote,Calibre,Categoria,Campaign,CurrentCampaign,Cliente
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
            if request.user.rol == "REG":
                return redirect('index')
            elif request.user.rol == "EMB":
                return redirect('embarque')
            elif request.user.rol == "LEC":
                return redirect('lector')
            else:
                cerrarSesion(request)
    else:
        try:
            user = authenticate(username=request.POST['user'], password=request.POST['password'])
            if user is not None:    
                login(request,user)
                if request.user.rol == "REG":
                    return redirect('index')
                elif request.user.rol == "EMB":
                    return redirect('embarque')
                elif request.user.rol == "LEC":
                    return redirect('lector')
                else:
                    return render(request, 'login.html',{
                        'form' : UserCreationForm,
                        'error' : 'Error en el rol'
                    })
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
    elif request.user.rol == "LEC":
        return redirect('lector')
    elif request.user.rol == "REG":
        try:
            campaign = Campaign.objects.get(planta=request.user.planta,state=True)
            if not request.user.campaign_set.filter(pk=campaign.pk).exists():
                data = {
                    'success' : False,
                    'message' : 'Usuario no registrado'
                }
                return JsonResponse(data,safe=False)
            pallets = Pallet.objects.all()
            presentaciones = Presentacion.objects.filter(campaign=campaign)
            variedades = Variedad.objects.filter(campaign=campaign)
            calibres = Calibre.objects.values('id','calibre')
            categorias = Categoria.objects.values('id','categoria')
            etiquetas = Etiqueta.objects.filter(campaign=campaign)
            
            return render(request, 'index.html',{
                'pallets':pallets,
                'presentaciones': presentaciones,
                'variedades' : variedades,
                'calibres' : calibres,
                'categorias' : categorias,
                'etiquetas' : etiquetas,
            })
        except Campaign.DoesNotExist:
            data = {
                'success' : False,
                'message' : "No hay campaña abierta" 
            }
            return JsonResponse(data, safe=False)
        except Exception as e:
            data = {
                'success' : False,
                'message' : str(e)
            }
            return JsonResponse(data, safe=False)
    else:
        cerrarSesion(request)
def tablaPallet(request):
    try:
        data = dict()
        campaign = Campaign.objects.get(planta=request.user.planta_id,state=True)
        pallets = Pallet.objects.filter(embarcado=False,campaign=campaign).order_by('-updated_at')
        context = {
            'pallets':pallets
        }
        data['tabla'] = render_to_string('tabla_pallet.html',context,request=request)
    except:
        data = {
            'success' : 'False',
            'message' : 'No hay camapaña activa'
        }
    return JsonResponse(data)
def datosPallet(request):
    if request.user.is_authenticated:
        try:
            codigo_del_pallet = request.GET['codigo']
            codigo_desglozado = codigo_del_pallet.split('-')
            if len(codigo_desglozado) == 2:
                try:
                    campaign = Campaign.objects.get(planta=request.user.planta_id,state=True)
                    codigo_de_la_variedad = str(codigo_desglozado[0])
                    numero_del_pallet = int(codigo_desglozado[1])
                    if not Variedad.objects.filter(codigo=codigo_de_la_variedad,campaign=campaign).exists():
                        data = {
                            'success' : False,
                            'message' : 'Código de la variedad no inválido',
                            'icon' : 'error'
                        }
                    elif numero_del_pallet <= 0:
                        data = {
                            'success' : False,
                            'message': 'Falta el número del Pallet',
                            'icon' : 'error'
                        }
                    else:
                        try:
                            pallet = Pallet.objects.get(codigo=request.GET['codigo'],campaign=campaign,embarcado=False)
                            detalle = DetallePallet.objects.annotate(fundoLote=Concat('lote__fundo__fundo',Value(' '),'lote__lote')).filter(pallet=pallet).values('dia_de_proceso','numero_de_cajas','lote','fundoLote')
                            data = {
                                'success': True,
                                'codigo' : pallet.codigo,
                                'codigo_comercial': pallet.codigo_comercial,
                                'presentacion' : pallet.presentacion_id,
                                'presentacion_name' : pallet.presentacion.tipo_caja.tipo_caja,
                                'presentacion_peso' : pallet.presentacion.peso,
                                'variedad' : pallet.variedad.variedad,
                                'variedad_id' : pallet.variedad_id,
                                'calibre' : pallet.calibre_id,
                                'calibre_name' : pallet.calibre.calibre,
                                'etiqueta' : pallet.etiqueta_id,
                                'etiqueta_name' : pallet.etiqueta.etiqueta,
                                'categoria' : pallet.categoria_id,
                                'categoria_name' : pallet.categoria.categoria,
                                'detalle': list(detalle),
                                'message': 'Pallet encontrado',
                                'icon' : 'success' 
                            }
                        except Pallet.DoesNotExist:
                            try:
                                pallet = Pallet.objects.get(codigo=request.GET['codigo'],campaign=campaign)
                                data = {
                                    'success': False,
                                    'message': "El pallet ya fue embarcado",
                                    'icon' : 'warning'
                                }
                            except Pallet.DoesNotExist:
                                variedad = Variedad.objects.get(codigo=codigo_de_la_variedad)
                                data = {
                                    'success': False,
                                    'message': "Registre el pallet",
                                    'icon' : 'success',
                                    'variedad_id' : variedad.pk,
                                    'variedad' : variedad.variedad,
                                }
                        except Exception as e:
                            data = {
                                'success' : False,
                                'message' : str(e),
                                'icon' : 'error'
                            }
                except Campaign.DoesNotExist:
                    data = {
                        'success' : False,
                        'message' : 'No hay campaña activa',
                        'icon' : 'error'
                    }
                except ValueError:
                    data = {
                        'success' : False,
                        'message' : 'Codigo Inválido',
                        'icon' : 'error'
                     }
            else:
                data = {
                    'success' : False,
                    'message' : 'Código Inválido',
                    'icon' : 'error'
                }
        except MultiValueDictKeyError:
            data = {
                'success' : False,
                'message' : 'Falta el código',
                'icon' : 'error'
            }
    else:
        data = {
            'success' : False,
            'message' : 'No identificado'
        }
        
    return JsonResponse(data, safe=False)
def obtenerLotes(request):
    if(request.method != "GET"):
        data = {
            'success' : False,
            'message' : 'Método http no soportado',
            'icon' : 'error'
        }
    else:
        try:
            lotes = Lote.objects.annotate(text=Concat('fundo__fundo',Value(' '),'lote')).filter(text__icontains=request.GET['term']).values('id','text')
            data = {
                'success' : True,
                'message' : 'Transacción éxitosa',
                'lotes' : list(lotes),
                'icon' : 'error'
            }
        except Exception as e:
            data = {
                'success' : True,
                'message' : str(e),
                'icon' : 'error'
            }
    return JsonResponse(data,safe=False)
def registrarPallet(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            if request.POST['presentacion'] == "":
                 presentacion_post = "0";
            else:
                presentacion_post = request.POST['presentacion']
                                
            if request.POST['calibre'] == "":
                 calibre_post = "0"
            else:
                calibre_post = request.POST['calibre']
                
            if request.POST['categoria'] == "":
                 categoria_post = "0"
            else:
                categoria_post = request.POST['categoria']

            if request.POST['etiqueta'] == "":
                etiqueta_post = "0"
            else:
                etiqueta_post = request.POST['etiqueta']

            if request.POST['codigo'] == "":
                data = {
                    'success' : False,
                    'message' : 'Falta el código del Pallet',
                    'icon' : 'warning'
                }
            elif request.POST['codigo_comercial'] == "":
                data = {
                    'success' : False,
                    'message' : 'Falta el código comercial',
                    'icon' : 'warning'
                }
            elif not Presentacion.objects.filter(id=int(presentacion_post)).exists():
                data = {
                    'success' : False,
                    'message' : 'Presentación incorrecta',
                    'icon' : 'warning'
                }
            elif not Calibre.objects.filter(id=int(calibre_post)).exists():
                data = {
                    'success' : False,
                    'message' : 'Falta el calibre',
                    'icon' : 'warning'
                }
            elif not Etiqueta.objects.filter(id=int(etiqueta_post)).exists():
                data = {
                    'success' : False,
                    'message' : 'Falta la etiqueta',
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
                        campaign = Campaign.objects.get(planta=request.user.planta_id,state=True)
                        pallet = Pallet.objects.get(codigo=request.POST['codigo'],campaign=campaign,embarcado=False)

                        pallet.codigo_comercial = request.POST['codigo_comercial']
                        pallet.calibre_id = request.POST['calibre']
                        pallet.etiqueta_id =request.POST['etiqueta']
                        pallet.variedad = Variedad.objects.get(codigo=request.POST['codigo'].split("-")[0])
                        pallet.presentacion_id = request.POST['presentacion']
                        pallet.categoria_id = request.POST['categoria']
                        pallet.cantidad_de_cajas = presentacion.cantidad_de_cajas
                        pallet.save()
                        DetallePallet.objects.filter(pallet=pallet).delete()
                        for detalle in detalles:
                            lote = Lote.objects.get(id=detalle[2])
                            DetallePallet.objects.create(
                                dia_de_proceso = detalle[0],
                                numero_de_cajas = detalle[1],
                                lote = lote,
                                pallet_id = pallet.pk,
                                usuario_id = request.user.id
                            )                
                        data =  {
                            'success': True,
                            'message': 'Se actualizó el pallet ' + request.POST['codigo'].upper(),
                            'icon' : 'success'
                        }
                    except Pallet.DoesNotExist:
                        pallet = Pallet(
                            campaign = Campaign.objects.get(planta=request.user.planta_id,state=True),
                            codigo = request.POST['codigo'],
                            codigo_comercial = request.POST['codigo_comercial'],
                            calibre_id = request.POST['calibre'],
                            etiqueta_id = request.POST['etiqueta'],
                            variedad = Variedad.objects.get(codigo=request.POST['codigo'].split("-")[0]),
                            presentacion_id = request.POST['presentacion'],
                            categoria_id = request.POST['categoria'],
                            completo = False,
                            cantidad_de_cajas = presentacion.cantidad_de_cajas
                        )
                        pallet.save()
                        DetallePallet.objects.filter(pallet=pallet).delete()
                        for detalle in detalles:
                            lote = Lote.objects.get(id=detalle[2])
                            DetallePallet.objects.create(
                                dia_de_proceso=detalle[0],
                                numero_de_cajas=detalle[1],
                                lote=lote,
                                pallet_id=pallet.pk,
                                usuario_id=request.user.id
                            )
                        data = {
                            'success':True,
                            'message':'Se creó el pallet ' + request.POST['codigo'].upper(),
                            'icon' : 'success'
                        }
                    except Campaign.DoesNotExist:
                        data = {
                            'success' : False,
                            'message' : 'No hay camapaña activa',
                            'icon' : 'error'
                        }
                    except Exception as e:
                        data = {
                            'success' : False,
                            'message' : str(e),
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
            if(request.GET['codigo'] == ''):
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
def lector(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    elif request.user.rol == "EMB":
        return redirect('embarque')
    elif request.user.rol == "REG":
        return redirect('index')
    elif request.user.rol == "LEC":
        try:
            campaign = Campaign.objects.get(planta=request.user.planta_id,state=True)
            pallets = Pallet.objects.all()
            return render(request, 'lector.html',{
                'pallets':pallets
            })
        except Campaign.DoesNotExist:
            data = {
                'success' : False,
                'message' : "No hay ninguna campaña activa" 
            }
            return JsonResponse(data, safe=False)
        except Exception as e:
            data = {
                'success' : False,
                'message' : str(e)
            }
            return JsonResponse(data, safe=False)
    else:
        cerrarSesion(request)      
def tablaDetalle(request):
    if not request.user.is_authenticated:
        return redirect('%s?next=%s' % (settings.LOGIN_URL, request.path))
    elif request.user.rol == "EMB":
        return redirect('embarque')
    elif request.user.rol == "REG":
        return redirect("index")
    else:
        return redirect("login")
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
            pallet_para_poner = Pallet.objects.get(codigo=request.GET['codigo_pallet_para_poner'],completo=False,embarcado=False,presentacion=pallet_para_sacar.presentacion,variedad=pallet_para_sacar.variedad,calibre=pallet_para_sacar.calibre,categoria=pallet_para_sacar.categoria,etiqueta=pallet_para_sacar.etiqueta)
            
            cajas_puestas = DetallePallet.objects.filter(pallet=pallet_para_poner).aggregate(cajas = Sum('numero_de_cajas'))
            cajas_disponibles_para_sacar = DetallePallet.objects.filter(pallet=pallet_para_sacar).aggregate(cajas = Sum('numero_de_cajas'))
            try:
                cajas_necesarias_para_completar = pallet_para_poner.cantidad_de_cajas - cajas_puestas['cajas']
            except TypeError:
                cajas_necesarias_para_completar = pallet_para_poner.cantidad_de_cajas
            if(pallet_para_poner.completo or pallet_para_sacar.completo):
                data = {
                    'success' : False,
                    'title' : 'Pallet completo',
                    'message' : 'El pallet ya está completo',
                    'icon' : 'warning'
                } 
            else:
                try:
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
                except TypeError:
                    data = {
                        'success' : False,
                        'title' : 'Pallet sin cajas',
                        'message' : 'Pallet sin cajas',
                        'icon' : 'warning'
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
                            dia_de_proceso=detalle.dia_de_proceso,
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
    try:
        campaign = Campaign.objects.get(planta=request.user.planta,state=True)
        pallets = Pallet.objects.filter(completo=True,campaign=campaign,embarcado=eval(request.GET['modo'].capitalize())).order_by('-updated_at')
        context = {
            'pallets':pallets
        }
        data['tabla'] = render_to_string('tabla_embarque.html',context,request=request)
    except:
        data = {
            'success' : False,
            'message' : 'No hay campaña activa'
        }
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
            modo_embarque = eval(request.POST['modo_embarque'].capitalize())
            if(pallet.embarcado != modo_embarque):
                pallet.embarcado = modo_embarque;
                pallet.save()
                if(modo_embarque):
                    title =  "¡Embarcado!",
                    message = "N° " + request.POST['codigo_pallet'].upper(),
                    icon = "success"
                else:
                    title = "¡Desembarcado!",
                    message = 'N° ' +request.POST['codigo_pallet'].upper(),
                    icon = "info"
                data = {
                    'success' : True,
                    'title': title,
                    'message': message,
                    'icon': icon
                } 
            else:
                data = {
                    'success' : False,
                    'title' : 'Pallet Repetido',
                    'message' : 'N° ' + request.POST['codigo_pallet'].upper(),
                    'icon' : 'warning'
                }
        except Pallet.DoesNotExist:
            data = {
                'success' : False,
                'title' : '¡Error!',
                'message' : 'El pallet aún no está completo',
                'icon' : 'warning'
            }
        except Exception as e:
            data = {
            'success' : True,
            'title': "¡Pallet incompleto!",
            'message' : str(e),
            'icon': "warning"
        }

    return JsonResponse(data,safe=False)
