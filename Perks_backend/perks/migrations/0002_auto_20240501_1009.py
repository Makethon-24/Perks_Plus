# Generated by Django 3.2.12 on 2024-05-01 10:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('perks', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='card',
            old_name='user',
            new_name='userid',
        ),
        migrations.AlterField(
            model_name='card',
            name='card_number',
            field=models.IntegerField(max_length=50),
        ),
    ]
