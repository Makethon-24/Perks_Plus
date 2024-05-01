from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from perks.models import User , Card , otpTokens
from perks.serializers import UserSerializer
from django.contrib.auth.hashers import check_password
# Create your views here.


from django.contrib.auth.hashers import make_password
import random
from django.core.mail import send_mail

def generate_otp():
    otp = ''.join([str(random.randint(0, 9)) for _ in range(6)])
    return otp

def send_otp_email(email, otp):
    subject = 'Your OTP'
    message = f'Your OTP is: {otp}'
    send_mail(subject, message, 'your_email@gmail.com', [email])


class UserRegistration(APIView):
    
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            print(serializer.data)
            userid = serializer.validated_data.get('userid')
            password = serializer.validated_data.get('password')
            phone_number = serializer.validated_data.get('phone_number')
            gmail = serializer.validated_data.get('gmail')
            list_of_cards = request.data.get('list_of_cards')
            # Hash the password
            hashed_password = make_password(password)

            # Create and save the user object with the hashed password
            member = User(userid=userid, password=hashed_password, phone_number=phone_number, gmail=gmail)
            member.save()
            if len(list_of_cards) > 0:
                for card_number in list_of_cards:
                    card_obj = Card(userid=member, card_number=card_number)
                    card_obj.save()
            else:
                return Response({"message": "User Registered Successfully with no cards"}, status=status.HTTP_201_CREATED)

            return Response({"message": "User Registered Successfully"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)






class UserLogin(APIView):
    def get(self, request):
        userid = request.query_params.get('userid')
        password = request.query_params.get('password')
        
        # Authenticate user using userid and password
        user = User.objects.filter(userid=userid).first()
        if user is not None and check_password(password, user.password):

            otp = generate_otp()
            send_otp_email(user.gmail, otp)
            otp_obj = otpTokens(userid=user, otp=otp)
            otp_obj.save()
            return Response({"message": "OTP sent successfully"}, status=status.HTTP_200_OK)
        else:
            return Response({"message": "Check user Id password "}, status=status.HTTP_400_BAD_REQUEST)

    

class otp_verification(APIView):
    def get(self, request):
        userid = request.query_params.get('userid')
        user_otp = request.query_params.get('otp')
        user = User.objects.filter(userid=userid).first()
        print(user_otp)
        if user_otp == otpTokens.objects.filter(userid=user).last().otp:
            return Response({"message": "OTP verified successfully"}, status=status.HTTP_200_OK)
        return Response({"message": "OTP verification failed"}, status=status.HTTP_400_BAD_REQUEST)