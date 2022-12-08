from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.autenticacion, name='login'),
    path('logout/',views.cerrarSesion,name='logout'),
    path('datos/', views.datosPallet, name='datos_pallet'),
    path('tabla/', views.tablaPallet, name='tabla_pallet'),
    path('add_pallet/', views.registrarPallet, name='add_pallet'),
    path('cantidad_cajas/', views.cantidadCajas, name='cantidad_cajas'),
    path('detalle/', views.tablaDetalle, name='detalle'),
    path('remontabilidad/', views.remontabilidad, name='remontabilidad'),
    path('remontar/', views.remontar, name='remontar'),
]