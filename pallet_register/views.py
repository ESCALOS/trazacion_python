from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login,authenticate,logout
from django.db import IntegrityError
from .models import Pallet,DetallePallet,Presentacion,Variedad,Calibre,Categoria
from django.http import JsonResponse
from django.conf import settings

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
                detalle = DetallePallet.objects.filter(pallet__codigo = request.POST['codigo']).values('numero_de_guia','numero_de_cajas','lote_id')
                data = {
                    'success': True,
                    'pallet': pallet,
                    'detalle': list(detalle)
                    }
                return JsonResponse(data, safe=False)
            except Pallet.DoesNotExist:
                data['success'] = False
                data['message'] = "No se encontro el pallet"
                return JsonResponse(data)
            except Exception as e:
                data = {
                    'success' : False,
                    'error' : e
                }
                return JsonResponse(data, safe=False)
        else:
            data = {'success' : 'Fue por get'}
            return JsonResponse(list(data))
    else:
        data = {'success': 'No identificado'}
        return JsonResponse(list(data))