# Generated by Django 4.1.3 on 2022-12-28 18:13

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('pallet_register', '0002_campaign_clientes_campaign_presentaciones_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='pallet',
            name='cliente',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.RESTRICT, to='pallet_register.cliente'),
            preserve_default=False,
        ),
    ]