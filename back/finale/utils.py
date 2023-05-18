from django.db.models import Sum
from .models import Contestant, Score

def get_contestant_score(username):
    try:
        contestant = Contestant.objects.get(user__username=username)  # Replace 'user_id' with the actual user ID
        total_points = Score.objects.filter(contestant=contestant).aggregate(total_score=Sum('points'))['total_score']
        return total_points if total_points and total_points > 0 else 0
    except (Contestant.DoesNotExist):
        return 0

def compute_leaderboard():
    leaderboard = []
    contestants = Contestant.objects.select_related('user').all()

    for contestant in contestants:
        username = contestant.user.username
        total_points = get_contestant_score(username)
        leaderboard.append((username, total_points, Contestant.House(contestant.house).label, contestant.rank_checkpoint))

    # Sort the leaderboard based on total points in descending order
    leaderboard.sort(key=lambda x: x[1], reverse=True)

    # Assign ranks to contestants with the same score
    rank = 0
    prev_score = None
    ranked_leaderboard = []
    for entry in leaderboard:
        if entry[1] != prev_score:
            rank += 1
        tmp = {
                "username": entry[0],
                "house": entry[2],
                "score": entry[1],
                "rank": rank,
                "progress": entry[3] - rank
            }
        ranked_leaderboard.append(tmp)
        prev_score = entry[1]

    return ranked_leaderboard