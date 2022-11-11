from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.autenticacion, name='login'),
    path('logout/',views.cerrarSesion,name='logout'),
    path('datos/', views.datosPallet, name="datos_pallet")
]