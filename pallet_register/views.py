from django.shortcuts import render,redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.contrib.auth import login,authenticate
from django.db import IntegrityError
from .models import Pallet
from django.http import JsonResponse

def autenticacion(request):
    
    if request.method == "GET":
        return render(request, 'login.html',{
            'form' : UserCreationForm
        })
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
    
def index(request):
    return render(request, 'index.html')

def datosPallet(request):
    if request.method == "POST":
        pallet = list(User.objects.values())
        return JsonResponse(pallet,safe=False)
    else:
        return render(request, 'index.html')