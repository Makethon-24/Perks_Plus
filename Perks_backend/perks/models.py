from django.db import models

# Create your models here.
class User(models.Model):
    userid = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=100)
    gmail = models.CharField(max_length=100)
    phone_number = models.CharField(max_length=20)

class Card(models.Model):
    userid = models.ForeignKey(User, on_delete=models.CASCADE)
    card_number = models.IntegerField()

class otpTokens(models.Model):
    userid = models.ForeignKey(User, on_delete=models.CASCADE)
    otp = models.CharField(max_length=6)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
