from django import forms
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from .models import Usuario

class FormaRegistro(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirmar contraseña',widget=forms.PasswordInput)
    
    class Meta:
        model = Usuario
        fields = ('codigo',)
        
    def clean_code(self):
        codigo = self.cleaned_data.get('codigo')
        qs = Usuario.objects.filter(codigo=codigo)
        if qs.exists():
            raise forms.ValidationError("Codigo ya registrado")
        return codigo
    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Las contraseñas no coinciden")
        return password2
class AdminFormaCreacionUsuario(forms.ModelForm):
    password1 = forms.CharField(label="Contraseña",widget=forms.PasswordInput)
    password2 = forms.CharField(label="Confirmar contraseña",widget=forms.PasswordInput)
    
    class Meta:
        model = Usuario
        fields = ('codigo','dni','nombre','apellido')
        
    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Contraseñas no coinciden")
        return password2
    
    def save(self,commit=True):
        usuario = super(AdminFormaCreacionUsuario,self).save(commit=False)
        usuario.set_password(self.cleaned_data["password1"])
        if commit:
            usuario.save()
        return usuario
class AdminFormaActualiza(forms.ModelForm):
    password = ReadOnlyPasswordHashField
    
    class Meta:
        model = Usuario
        fields = ('codigo','password','dni','nombre','apellido','active','admin')
        
    def cleaned_password(self):
        return self.initial['password']