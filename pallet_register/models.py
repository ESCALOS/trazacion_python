from django.db import models

class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True,editable=False)
    updated_at = models.DateTimeField(auto_now=True,editable=False)

    class Meta:
        abstract = True


class Zona(BaseModel):
    zona = models.CharField(max_length=50)
    
    def __str__(self):
        return self.zona
    
class Sede(BaseModel):
    sede = models.CharField(max_length=50)
    zona_id = models.ForeignKey(Zona, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.sede + ' | ' + self.zona_id.zona

class Fundo(BaseModel):
    fundo = models.CharField(max_length=100)
    sede_id = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.fundo + ' | ' + self.sede_id.sede + ' | ' + self.sede_id.zona_id.zona
    
class Planta(BaseModel):
    planta = models.CharField(max_length=100)
    sede_id = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.planta + ' | ' + self.sede_id.sede + ' | ' + self.sede_id.zona_id.zona
    
class Lote(BaseModel):
    lote = models.CharField(max_length=50)
    fundo_id = models.ForeignKey(Fundo, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.lote + ' | ' + self.fundo_id.fundo

class Calibre(BaseModel):
    calibre = models.CharField(max_length=100)
    
    def __str__(self):
        return self.calibre
    
class Variedad(BaseModel):
    variedad = models.CharField(max_length=100)
    
    def __str__(self):
        return self.variedad
    
class Presentacion(BaseModel):
    presentacion = models.CharField(max_length=100)
    cantidad_de_cajas = models.IntegerField(default=0)
    
    def __str__(self):
        return self.presentacion
    
class Categoria(BaseModel):
    categoria = models.CharField(max_length=50)
    
    def __str__(self):
        return self.categoria
    
class Pallet(BaseModel):
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
    
    def __str__(self):
        return self.codigo + ' | ' + self.planta_id.planta
    
class DetallePallet(BaseModel):
    pallet_id = models.ForeignKey(Pallet, on_delete=models.RESTRICT)
    lote_id = models.ForeignKey(Lote, on_delete=models.RESTRICT)
    numero_de_guia = models.CharField(max_length=255)
    numero_de_cajas = models.BigIntegerField(default=0)
    
    def __str__(self):
        return self.codigo + ' | ' + self.lote_id.lote + ' | ' + self.numero_de_guia