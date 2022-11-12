from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login,authenticate,logout
from django.db import IntegrityError
from .models import Pallet,Presentacion,Variedad,Calibre,Categoria
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
            qs = Pallet.objects.filter(codigo=request.POST['codigo']).values('codigo','presentacion','variedad','dp','calibre','categoria','plu')[:1]
            if qs.exists():
                return JsonResponse(list(qs),safe=False)
    else:
        return redirect('login')