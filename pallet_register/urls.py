from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.autenticacion, name='login'),
    path('datos/', views.datosPallet, name="datos_pallet")
]