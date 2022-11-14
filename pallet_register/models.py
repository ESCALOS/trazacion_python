from django.db import models
from django.contrib.auth.models import (BaseUserManager,AbstractBaseUser)
        
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
        return self.sede + ' | ' + self.zona.zona

class Fundo(BaseModel):
    fundo = models.CharField(max_length=100)
    sede = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.fundo + ' | ' + self.sede.sede + ' | ' + self.sede.zona.zona
    
class Planta(BaseModel):
    planta = models.CharField(max_length=100)
    sede = models.ForeignKey(Sede, on_delete=models.RESTRICT)
    
    def __str__(self):
        return self.planta + ' | ' + self.sede.sede + ' | ' + self.sede.zona.zona

class Usuario(AbstractBaseUser):
    codigo = models.CharField(max_length=6,unique=True)
    dni = models.CharField(max_length=12)
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    planta = models.ForeignKey(Planta, on_delete=models.RESTRICT, null=True)
    
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
        return self.lote + ' | ' + self.fundo.fundo

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
    dp = models.CharField(max_length=150,null=True)
    planta = models.ForeignKey(Planta, on_delete=models.RESTRICT)
    calibre = models.ForeignKey(Calibre, on_delete=models.RESTRICT)
    variedad = models.ForeignKey(Variedad, on_delete=models.RESTRICT)
    presentacion = models.ForeignKey(Presentacion, on_delete=models.RESTRICT)
    categoria = models.ForeignKey(Categoria, on_delete=models.RESTRICT)
    plu = models.BooleanField(default=False)
    completo = models.BooleanField(default=False)
    cantidad_de_cajas = models.IntegerField(default=90)
    
    def __str__(self):
        return self.codigo + ' | ' + self.planta.planta
    
class DetallePallet(BaseModel):
    pallet = models.ForeignKey(Pallet, on_delete=models.RESTRICT)
    lote = models.ForeignKey(Lote, on_delete=models.RESTRICT)
    numero_de_guia = models.CharField(max_length=255)
    numero_de_cajas = models.BigIntegerField(default=0)
    usuario = models.ForeignKey(Usuario, on_delete=models.RESTRICT)
    
    def __str__(self):
        return 'Pallet: ' + self.pallet.codigo + ' | Lote: ' + self.lote.lote + ' | Guia: ' + self.numero_de_guia