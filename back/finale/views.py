from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from .models import House, User, Contestant
from django.db.models import F, Q, Count, Sum
from django.views.decorators.csrf import csrf_exempt
import json


def compute_leaderboard():
    # Get all the contestants and their total score
    contestants = (
        Contestant.objects
        .select_related('user', 'house')
        .annotate(total_score=Sum('score'))
        .order_by('-total_score', 'user__username')
    )

    # Compute the ranking of the contestants based on their total score
    ranking = {}
    rank = 1
    for c in contestants:
        if c.total_score in ranking:
            # If there are ex-aequo contestants, they should have the same rank
            c.rank = ranking[c.total_score]
        else:
            c.rank = rank
            ranking[c.total_score] = rank
            rank += 1

        # Compute the progress between the current rank and the previous checkpoint rank
        c.progress = c.rank - c.rank_checkpoint

    # Build a list of dictionaries containing each contestant's data
    leaderboard_data = [
        {
            'username': c.user.username,
            'house': c.house.name,
            'score': c.total_score,
            'rank': c.rank,
            'progress': -c.progress,
        }
        for c in contestants
    ]
    return leaderboard_data

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
        "score": house.total_score(),
        'contestants': [{
            'username': contestant.user.username,
            'name': f'{contestant.user.first_name} {contestant.user.last_name}',
            'score': contestant.score
        } for contestant in contestants]
    }
    return JsonResponse(response_data, safe=False)

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
            return JsonResponse({'success': True, 'leaderboard': compute_leaderboard()})
        except Contestant.DoesNotExist:
            return JsonResponse({'error': 'Contestant not found'})
    else:
        return JsonResponse({'error': 'Invalid request method'})

def leaderboard(request):
    leaderboard_data = compute_leaderboard()

    # Return a JsonResponse containing the leaderboard data
    return JsonResponse(leaderboard_data, safe=False)