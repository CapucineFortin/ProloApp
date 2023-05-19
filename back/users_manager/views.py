from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from .models import ProloginUser

def get_users(request):
    users = ProloginUser.objects.all().values('username', 'first_name', 'last_name')
    users_list = list(users)
    return JsonResponse({"nb_users": len(users_list), "users":users_list}, safe=False)

def get_user(request, login):
    user = get_object_or_404(ProloginUser, username=login)
    return JsonResponse(user, safe=False)
