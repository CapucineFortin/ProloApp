from django.shortcuts import get_object_or_404
from django.db.models import Sum
from django.http import JsonResponse
from .models import Contestant, Score
from .utils import compute_leaderboard, get_contestant_score
from django.views.decorators.csrf import csrf_exempt
import json

def get_contestant(request, username):
    contestant = get_object_or_404(Contestant, user__username=username)
    house_name = contestant.get_house_display()
    score = Score.objects.filter(contestant=contestant).aggregate(total_score=Sum('points'))['total_score'] or 0

    contestant_info = {
        'username': username if username != 'gurvan.biguet–kerloch' else 'gurvan.biguet-kerloch',
        'name': f'{contestant.user.first_name} {contestant.user.last_name}',
        'house': house_name,
        'score': score,
    }
    return JsonResponse(contestant_info, safe=False)

def get_contestants(request):
    contestants = Contestant.objects.all()
    response = [{
        'username': contestant.user.username if contestant.user.username != 'gurvan.biguet–kerloch' else 'gurvan.biguet-kerloch',
        'name': f'{contestant.user.first_name} {contestant.user.last_name}',
        'house': contestant.get_house_display(),
        'score': get_contestant_score(contestant.user.username),
        } for contestant in contestants]
    return JsonResponse(response, safe=False)        

def get_houses(request):
    house_scores = Contestant.objects.values('house').annotate(total_score=Sum('score__points'))

    # Create a list to store the results
    results = []
    for score in house_scores:
        house = Contestant.House(score['house']).label
        total_score = score['total_score']
        result = {'name': house, 'points': total_score if total_score and total_score > 0 else 0}
        results.append(result)

    return JsonResponse(results, safe=False)

def get_house_contestants(request, house_name):
    contestants = Contestant.objects.filter(house=Contestant.House[house_name].value)
    leaderboard = []

    for contestant in contestants:
        username = contestant.user.username if contestant.user.username != 'gurvan.biguet–kerloch' else 'gurvan.biguet-kerloch'
        total_points = get_contestant_score(username)
        leaderboard.append((username, total_points))

    # Sort the leaderboard based on total points in descending order
    leaderboard.sort(key=lambda x: x[1], reverse=True)

    return leaderboard

def leaderboard(request):
    leaderboard_data = compute_leaderboard()
    return JsonResponse(leaderboard_data, safe=False)

@csrf_exempt
def set_score(request, username):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))
        try:
            contestant = Contestant.objects.get(user__username=username)
            score = Score.objects.create(contestant=contestant, points=data['points'], category=data['point_type'])
            score.save()
            return JsonResponse({'success': True, 'leaderboard': compute_leaderboard()})
        except Contestant.DoesNotExist:
            return JsonResponse({'error': 'Contestant not found'})
    else:
        return JsonResponse({'error': 'Invalid request method'})
