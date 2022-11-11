from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from .forms import AdminFormaCreacionUsuario,AdminFormaActualiza
from . import models

admin.site.site_header = "Registro de Pallets"
admin.site.index_title = "Panel Administrativo"

class UserAdmin(BaseUserAdmin):
    form = AdminFormaActualiza
    add_form = AdminFormaCreacionUsuario
    
    list_display = ('codigo','admin')
    list_filter = ('admin',)
    fieldsets = (
        (None,{'fields': ('codigo','password')}),
        ('Informacion Personal',{'fields': ('dni','nombre','apellido',)}),
        ('Permisos Django',{'fields': ('admin','staff','active')}),
    )
    
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('codigo','password1','password2') 
        }),
    )
    
    search_fields = ('codigo',)
    ordering = ('codigo',)
    filter_horizontal = ()
    
admin.site.register(models.Usuario, UserAdmin)
admin.site.register(models.Zona)
admin.site.register(models.Sede)
admin.site.register(models.Fundo)
admin.site.register(models.Planta)
admin.site.register(models.Lote)
admin.site.register(models.Calibre)
admin.site.register(models.Variedad)
admin.site.register(models.Presentacion)
admin.site.register(models.Categoria)
admin.site.register(models.Pallet)
admin.site.register(models.DetallePallet)