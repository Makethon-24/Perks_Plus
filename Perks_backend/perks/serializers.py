from rest_framework import serializers
from perks.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['userid', 'password', 'gmail', 'phone_number']