from django.db import models
from django.contrib.auth.models import (BaseUserManager,AbstractBaseUser)
from django.utils.translation import gettext_lazy as _
from smart_selects.db_fields import ChainedManyToManyField
        
class BaseModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True,editable=False)
    updated_at = models.DateTimeField(auto_now=True,editable=False)

    class Meta:
        abstract = True
    
class ManejadorUsuario(BaseUserManager):
    def create_user(self,codigo,password=None):
        if not codigo:
            raise ValueError("El código no es válido")
        
        usuario = self.model(
            codigo = codigo
        )
        
        usuario.set_password(password)
        usuario.save(using=self._db)
        return usuario
    
    def create_staffuser(self,codigo,password):
        usuario = self.create_user(
            codigo,
            password=password
        )
        
        usuario.staff = True
        usuario.save(using=self._db)
        return usuario

    def create_superuser(self,codigo,password):
        usuario = self.create_user(
            codigo,
            password=password
        )
        
        usuario.staff = True
        usuario.admin = True
        usuario.save(using=self._db)
        return usuario

class Zona(BaseModel):
    zona = models.CharField(max_length=50)
    
    def __str__(self):
        return self.zona
    
class Sede(BaseModel):
    sede = models.CharField(max_length=50)
    zona = models.ForeignKey(Zona, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.sede + ' |     ' + self.zona.zona

class Fundo(BaseModel):
    fundo = models.CharField(max_length=100)
    codigo_lugar_produccion = models.CharField(verbose_name="Codigo de Lugar de Producción",max_length=150)
    sede = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.fundo + ' | ' + self.sede.sede + ' | ' + self.sede.zona.zona
    
class Planta(BaseModel):
    planta = models.CharField(max_length=100)
    sede = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.planta + ' | ' + self.sede.sede + ' | ' + self.sede.zona.zona

class Producto(BaseModel):
    producto = models.CharField(max_length=150)

    def __str__(self):
        return self.producto


class Usuario(AbstractBaseUser):

    class Roles(models.TextChoices):
        ENCARGADO = "LEC", _('Lector')
        REGISTRADOR = "REG", _('Registrador')
        REMONTADOR = "REM",_('Remontador')
        EMBARCADOR = "EMB", _('Embarcador')

    codigo = models.CharField(max_length=6,unique=True)
    dni = models.CharField(max_length=12)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    planta = models.ForeignKey(Planta, on_delete=models.RESTRICT, null=True)
    
    rol = models.CharField(
        max_length=3,
        choices=Roles.choices,
        default=Roles.REGISTRADOR
    )
    active = models.BooleanField(verbose_name="Activo", default=True)
    staff = models.BooleanField(default=False)
    admin = models.BooleanField(default=False)
    
    objects = ManejadorUsuario()
    
    USERNAME_FIELD = 'codigo'
    REQUIRED_FIELDS = []
    
    class Meta:
        verbose_name = 'usuarios'
        verbose_name_plural = 'usuario'
    
    def get_full_name(self):
        return self.nombre + ' ' + self.apellido
    
    def get_short_name(self):
        return self.nombre
    
    def has_perm(self,perm,obj=None):
        "¿El usuario cuenta con un permiso específico?"
        return True
    
    def has_module_perms(self,app_label):
        "¿El usuario cuenta con los permisos para ver una app en específico?"
        return True
    
    @property
    def is_staff(self):
        "¿El usuario es staff (no super-usuario?"
        return self.staff
        
    @property
    def is_admin(self):
        "¿El usuario es un administrador (super-usuario)?"
        return self.admin
    
    @property
    def is_active(self):
        return self.active
    
    def __str__(self):
        return self.codigo + ' - ' + self.nombre + ' ' + self.apellido
    
class Lote(BaseModel):
    lote = models.CharField(max_length=50)
    fundo = models.ForeignKey(Fundo, on_delete=models.RESTRICT)

    def __str__(self):
        return str(self.lote) + ' | ' + self.fundo.fundo

class Calibre(BaseModel):
    calibre = models.CharField(max_length=100)
    
    def __str__(self):
        return self.calibre
    
class Variedad(BaseModel):
    codigo = models.CharField(max_length=3,default='RG')
    variedad = models.CharField(max_length=100)
    producto = models.ForeignKey(Producto, on_delete=models.RESTRICT)

    class Meta:
        verbose_name_plural = "Variedades"
    
    def __str__(self):
        return self.variedad

class TipoCaja(BaseModel):
    tipo_caja = models.CharField(max_length=255)

    class Meta:
        verbose_name = "Tipo de Caja"

    def __str__(self):
        return self.tipo_caja

class Presentacion(BaseModel):
    tipo_caja = models.ForeignKey(TipoCaja, on_delete=models.RESTRICT)
    peso = models.DecimalField(max_digits=3,decimal_places=1)
    cantidad_de_cajas = models.IntegerField(default=100) 
    productos = models.ManyToManyField(Producto)

    class Meta:
        verbose_name_plural = "Presentaciones"

    def __str__(self):
        return self.tipo_caja.tipo_caja + ' ' + str(self.peso) + ' KG'
    
class Etiqueta(BaseModel):
    etiqueta = models.CharField(max_length=250)

    def __str__(self):
        return self.etiqueta

class Categoria(BaseModel):
    categoria = models.CharField(max_length=50)
    
    def __str__(self):
        return self.categoria

class Destino(BaseModel):
    destino = models.CharField(max_length=150)

    def __str__(self):
        return self.destino

class Cliente(BaseModel):
    cliente = models.CharField(max_length=150)
    destino = models.ManyToManyField(Destino)

    def __str__(self):
        return self.cliente

class Campaign(BaseModel):
    planta = models.ForeignKey(Planta,on_delete=models.RESTRICT)
    inicio = models.DateField()
    producto = models.ForeignKey(Producto, on_delete=models.RESTRICT,default=1)
    state = models.BooleanField(verbose_name="Activo",default=True)
    presentaciones = ChainedManyToManyField(
            Presentacion,
            horizontal = True,
            chained_field = 'producto',
            chained_model_field = 'productos'
    )
    variedades = ChainedManyToManyField(
        Variedad,
        horizontal = True,
        chained_field = 'producto',
        chained_model_field = 'producto'
    )
    etiquetas = models.ManyToManyField(Etiqueta)
    usuarios = ChainedManyToManyField(
        Usuario, 
        verbose_name = 'Personal',
        horizontal = True,
        chained_field = 'planta',
        chained_model_field = 'planta'
    )

    class Meta:
        verbose_name = "Campaña"

    def __str__(self):
        return self.planta.planta + ' | ' + self.producto.producto  + ' | ' + str(self.inicio)

class CodigoComercial(BaseModel):
    cliente = models.ForeignKey(Cliente, on_delete=models.RESTRICT)
    cantidad_de_pallets = models.IntegerField(default=0)
    campaign = models.ForeignKey(Campaign, on_delete=models.RESTRICT)

    def __str__(self):
        return 'BU-' + str(self.id) + ' | Cliente: ' + str(self.cliente.cliente) + ' | Campaña: ' + self.campaign.planta.planta + ' | ' + self.campaign.producto.producto  + ' | ' + str(self.campaign.inicio)

class GuiaDeRemision(BaseModel):
    numero = models.CharField(max_length=15)
    codigo_comercial = models.ForeignKey(CodigoComercial, on_delete=models.RESTRICT)
    destino = models.ForeignKey(Destino, on_delete=models.RESTRICT)
    imagen = models.ImageField(upload_to='images/guia_de_remision/')
    embarcado = models.BooleanField(default=False)

    def __str__(self):
        return self.numero +'| BU-'+ str(self.codigo_comercial.id) +' | Campaña: ' + self.codigo_comercial.campaign.planta.planta + ' | ' + self.codigo_comercial.campaign.producto.producto  + ' | ' + str(self.codigo_comercial.campaign.inicio)

class CurrentCampaign(BaseModel):
    campaign = models.ForeignKey(Campaign, verbose_name="Campaña", on_delete=models.RESTRICT, limit_choices_to={'state':True},)
    inicio =  models.DateTimeField(auto_now_add=True,editable=False)
    fin =  models.DateTimeField(auto_now=True,editable=False)

    class Meta:
        verbose_name = "Campaña Actual"
        verbose_name_plural = "Campañas Actuales"
        get_latest_by = "-inicio"

    def __str__(self):
        return self.campaign.planta.planta +  ' | ' + self.campaign.producto.producto + ' | ' + str(self.inicio)

class Pallet(BaseModel):
    campaign = models.ForeignKey(Campaign, verbose_name="Campaña", on_delete=models.RESTRICT)
    codigo = models.CharField(max_length=255)
    codigo_comercial = models.CharField(max_length=50)
    calibre = models.ForeignKey(Calibre, on_delete=models.RESTRICT)
    variedad = models.ForeignKey(Variedad, on_delete=models.RESTRICT)
    presentacion = models.ForeignKey(Presentacion, on_delete=models.RESTRICT)
    categoria = models.ForeignKey(Categoria, on_delete=models.RESTRICT)
    etiqueta = models.ForeignKey(Etiqueta, on_delete=models.RESTRICT)
    completo = models.BooleanField(default=False)
    embarcado = models.BooleanField(default=False)
    cantidad_de_cajas = models.IntegerField(default=90)
    
    class Meta:
        get_latest_by = "order_date"
    
    def __str__(self):
        return self.codigo + ' | ' + self.campaign.planta.planta + ' | ' + self.campaign.producto.producto 
    
class DetallePallet(BaseModel):
    pallet = models.ForeignKey(Pallet, on_delete=models.RESTRICT)
    lote = models.ForeignKey(Lote, on_delete=models.RESTRICT)
    dia_de_proceso = models.IntegerField(default=1)
    numero_de_cajas = models.BigIntegerField(default=0)
    usuario = models.ForeignKey(Usuario, on_delete=models.RESTRICT)
    
    def __str__(self):
        return 'Pallet: ' + self.pallet.codigo + ' | Lote: ' + self.lote.lote + ' | Día de Proceso: ' + str(self.dia_de_proceso)
