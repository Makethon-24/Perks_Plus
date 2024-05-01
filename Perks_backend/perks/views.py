from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from perks.models import User , Card
from perks.serializers import UserSerializer
from django.contrib.auth.hashers import check_password
# Create your views here.


from django.contrib.auth.hashers import make_password

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
            return Response({"message": f"{user.userid} Logged In Successfully"}, status=status.HTTP_200_OK)
        else:
            return Response({"message": "Login Failed"}, status=status.HTTP_400_BAD_REQUEST)
