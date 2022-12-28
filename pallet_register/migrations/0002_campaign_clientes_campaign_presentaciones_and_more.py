# Generated by Django 4.1.3 on 2022-12-27 16:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pallet_register', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='campaign',
            name='clientes',
            field=models.ManyToManyField(to='pallet_register.cliente'),
        ),
        migrations.AddField(
            model_name='campaign',
            name='presentaciones',
            field=models.ManyToManyField(to='pallet_register.presentacion'),
        ),
        migrations.AddField(
            model_name='campaign',
            name='variedades',
            field=models.ManyToManyField(to='pallet_register.variedad'),
        ),
    ]
