# Generated by Django 3.2.12 on 2024-05-01 10:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('perks', '0002_auto_20240501_1009'),
    ]

    operations = [
        migrations.AlterField(
            model_name='card',
            name='card_number',
            field=models.IntegerField(),
        ),
    ]
