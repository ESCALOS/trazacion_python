from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login,authenticate,logout
from django.db import IntegrityError
from .models import Pallet,DetallePallet,Presentacion,Variedad,Calibre,Categoria
from django.http import JsonResponse
from django.conf import settings
import json

def autenticacion(request):
    
    if request.method == "GET":
        if not request.user.is_authenticated:
            return render(request, 'login.html',{
                'form' : UserCreationForm
            })
        else:
            return redirect('index')
    else:
        try:
            user = authenticate(username=request.POST['user'], password=request.POST['password'])
            if user is not None:    
                login(request,user)
                return redirect('index')
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
    else:
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
def datosPallet(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            try:
                pallet = Pallet.objects.values_list('codigo','dp','presentacion','variedad','calibre','categoria','plu', named=True).get(codigo=request.POST['codigo'])
                detalle = DetallePallet.objects.filter(pallet__codigo = request.POST['codigo']).values('numero_de_guia','numero_de_cajas','lote__lote')
                data = {
                    'success': True,
                    'pallet': pallet,
                    'detalle': list(detalle)
                }
                return JsonResponse(data, safe=False)
            except Pallet.DoesNotExist:
                data = {
                    'success': False,
                    'message': "Pallet no encontrado",
                }
                return JsonResponse(data, safe=False)
            except Exception as e:
                data = {
                    'success' : False,
                    'error' : e
                }
                return JsonResponse(data, safe=False)
        else:
            data = {'success' : 'Fue por get'}
            return JsonResponse(data, safe=False)
    else:
        data = {'success': 'No identificado'}
        return JsonResponse(data, safe=False)
def registrarPallet(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            try:
                detalles = json.loads(request.POST['detalles'])
                pallet = Pallet.objects.get(codigo=request.POST['codigo'])
                pallet.dp = request.POST['dp']
                pallet.calibre_id = request.POST['calibre']
                pallet.variedad_id =request.POST['variedad']
                pallet.presentacion_id = request.POST['presentacion']
                pallet.categoria_id = request.POST['categoria']
                pallet.plu = eval(request.POST['plu'].capitalize())
                pallet.save();
                DetallePallet.objects.filter(pallet=pallet).delete()
                for detalle in detalles:
                    DetallePallet.objects.create(numero_de_guia=detalle[0],numero_de_cajas=detalle[1],lote_id=1,pallet_id=pallet.pk,usuario_id=request.user.id)
                data =  {
                    'success': True,
                    'message': 'Se actualizó con éxito'
                }
            except:
                detalles = json.loads(request.POST['detalles'])
                presentacion = Presentacion.objects.get(id=request.POST['presentacion'])
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
                pallet.save();
                DetallePallet.objects.filter(pallet=pallet).delete()
                for detalle in detalles:
                    DetallePallet.objects.create(numero_de_guia=detalle[0],numero_de_cajas=detalle[1],lote_id=1,pallet_id=pallet.pk,usuario_id=request.user.id)
                data = {
                    'success':True,
                    'message':'Se creó con éxito'
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
