# Generated by Django 4.1.3 on 2022-12-30 09:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pallet_register', '0003_pallet_cliente'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='presentacion',
            name='producto',
        ),
        migrations.AddField(
            model_name='variedad',
            name='codigo',
            field=models.CharField(default='RG', max_length=3),
        ),
    ]
