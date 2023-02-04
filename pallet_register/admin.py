from import_export.admin import ImportExportModelAdmin
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
        (None,{'fields': ('codigo','password','planta','rol')}),
        ('Informacion Personal',{'fields': ('dni','nombre','apellido',)}),
        ('Permisos Django',{'fields': ('admin','staff','active')}),
    )
    
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('codigo','password1','password2','planta','rol') 
        }),
    )
    
    search_fields = ('codigo',)
    ordering = ('codigo',)
    filter_horizontal = ()

class CampaignAdmin(admin.ModelAdmin):
    filter_horizontal = ('etiquetas',)

class LoteAdmin(ImportExportModelAdmin):
    pass

class FundoAdmin(ImportExportModelAdmin):
    pass

admin.site.register(models.Usuario, UserAdmin)
admin.site.register(models.Zona)
admin.site.register(models.Sede)
admin.site.register(models.Fundo,FundoAdmin)
admin.site.register(models.Planta)
admin.site.register(models.Lote,LoteAdmin)
admin.site.register(models.Cliente)
admin.site.register(models.Etiqueta)
admin.site.register(models.Destino)
admin.site.register(models.TipoCaja)
admin.site.register(models.Campaign,CampaignAdmin)
admin.site.register(models.Producto)
admin.site.register(models.Calibre)
admin.site.register(models.CurrentCampaign)
admin.site.register(models.Variedad)
admin.site.register(models.Presentacion)
admin.site.register(models.Categoria)
admin.site.register(models.Pallet)
admin.site.register(models.DetallePallet)
