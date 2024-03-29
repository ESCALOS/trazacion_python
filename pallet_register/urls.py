from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.autenticacion, name='login'),
    path('logout',views.cerrarSesion,name='logout'),
    path('datos/', views.datosPallet, name='datos_pallet'),
    path('lotes/', views.obtenerLotes, name='lotes'),
    path('tabla/', views.tablaPallet, name='tabla_pallet'),
    path('add_pallet/', views.registrarPallet, name='add_pallet'),
    path('cantidad_cajas/', views.cantidadCajas, name='cantidad_cajas'),
    path('lector/', views.lector, name='lector'),
    path('detalle/', views.tablaDetalle, name='detalle'),
    path('remontabilidad/', views.remontabilidad, name='remontabilidad'),
    path('remontar/', views.remontar, name='remontar'),
    path('embarque/', views.embarque, name='embarque'),
    path('tabla_embarque/', views.tablaEmbarque, name='tabla_embarque'),
    path('embarcar/', views.embarcar, name='embarcar'),
]
