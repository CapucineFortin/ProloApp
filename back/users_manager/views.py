from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import House, User, Contestant
import json

# Create your views here.
def get_houses(request):
    houses = House.objects.all()
    response = [{
        "name": house.name,
        "score": house.total_score(),
    } for house in houses]
    return JsonResponse(response, safe=False)

def get_house_contestants(request, house_name):
    house = get_object_or_404(House, name=house_name)
    contestants = Contestant.objects.filter(house=house).select_related('user')
    response_data = {
        'house': house_name,
        "total_score": house.total_score(),
        'contestants': [{
            'username': contestant.user.username,
            'name': f'{contestant.user.first_name} {contestant.user.last_name}',
            'score': contestant.score
        } for contestant in contestants]
    }
    return JsonResponse(response_data, safe=False)

def get_users(request):
    users = User.objects.all().values('username', 'first_name', 'last_name')
    users_list = list(users)
    return JsonResponse({"nb_users": len(users_list), "users":users_list}, safe=False)

def get_contestants(request):
    contestants = Contestant.objects.all()
    response = [{
        'username': contestant.user.username,
        'name': f'{contestant.user.first_name} {contestant.user.last_name}',
        'house': contestant.house.name,
        'score': contestant.score,
        } for contestant in contestants]
    return JsonResponse(response, safe=False)

def get_contestant(request, username):
    contestant = get_object_or_404(Contestant, user__username=username)
    data = {
        'username': contestant.user.username,
        'name': f'{contestant.user.first_name} {contestant.user.last_name}',
        'house': contestant.house.name,
        'score': contestant.score
    }
    return JsonResponse(data)

@csrf_exempt
def set_contestant_score(request, username):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))
        try:
            contestant = Contestant.objects.get(user__username=username)
            contestant.score = data['score']
            contestant.save()
            return JsonResponse({'success': True})
        except Contestant.DoesNotExist:
            return JsonResponse({'error': 'Contestant not found'})
    else:
        return JsonResponse({'error': 'Invalid request method'})