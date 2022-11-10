from django.contrib import admin
from . import models

admin.site.site_header = "Registro de Pallets"
admin.site.index_title = "Panel Administrativo"

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