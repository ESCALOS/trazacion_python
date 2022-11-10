from django.db import models

class Zona(models.Model):
    zona = models.CharField(max_length=50)
    
class Sede(models.Model):
    sede = models.CharField(max_length=50)
    zona_id = models.ForeignKey(Zona, on_delete=models.RESTRICT)

class Fundo(models.Model):
    fundo = models.CharField(max_length=100)
    sede_id = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
class Planta(models.Model):
    planta = models.CharField(max_length=100)
    sede_id = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
class Lote(models.Model):
    lote = models.CharField(max_length=50)
    fundo_id = models.ForeignKey(Fundo, on_delete=models.RESTRICT)
    
class Calibre(models.Model):
    calibre = models.CharField(max_length=100)
    
class Variedad(models.Model):
    variedad = models.CharField(max_length=100)
    
class Presentacion(models.Model):
    presentacion = models.CharField(max_length=100)
    cantidad_de_cajas = models.IntegerField(default=0)
    
class Categoria(models.Model):
    categoria = models.CharField(max_length=50)
    
class Pallet(models.Model):
    codigo = models.CharField(max_length=255)
    dp = models.CharField(max_length=150)
    planta_id = models.ForeignKey(Planta, on_delete=models.RESTRICT)
    calibre_id = models.ForeignKey(Calibre, on_delete=models.RESTRICT)
    variedad_id = models.ForeignKey(Variedad, on_delete=models.RESTRICT)
    presentacion_id = models.ForeignKey(Presentacion, on_delete=models.RESTRICT)
    categoria_id = models.ForeignKey(Categoria, on_delete=models.RESTRICT)
    plu = models.BooleanField(default=False)
    completo = models.BooleanField(default=False)
    cantidad_de_cajas = models.IntegerField(default=90)
    
class DetallePallet(models.Model):
    pallet_id = models.ForeignKey(Pallet, on_delete=models.RESTRICT)
    lote_id = models.ForeignKey(Lote, on_delete=models.RESTRICT)
    numero_de_guia = models.CharField(max_length=255)
    numero_de_cajas = models.BigIntegerField(default=0)