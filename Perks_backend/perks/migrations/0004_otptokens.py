# Generated by Django 3.2.12 on 2024-05-01 17:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('perks', '0003_alter_card_card_number'),
    ]

    operations = [
        migrations.CreateModel(
            name='otpTokens',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('otp', models.CharField(max_length=6)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('userid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='perks.user')),
            ],
        ),
    ]
