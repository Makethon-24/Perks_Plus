from django.db import models

# Create your models here.
class User(models.Model):
    userid = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=100)
    gmail = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=20)

class Card(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    card_number = models.CharField(max_length=50)
