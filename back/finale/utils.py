from django.db.models import Sum
from .models import Contestant, Score
from datetime import datetime, time


def get_house_int(display_string):
    for choice in Contestant.House.choices:
        if choice[1] == display_string:
            return choice[0]
    return None

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
        activities =  contestant.get_score_categories(),

        leaderboard.append((username, total_points, Contestant.House(contestant.house).label, contestant.rank_checkpoint, activities))

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
                "username": entry[0] if entry[0] != 'gurvan.biguet–kerloch' else 'gurvan.biguet-kerloch',
                "house": entry[2],
                "score": entry[1],
                "rank": rank,
                "progress": entry[3] - rank,
                "activities": entry[4][0],

            }
        ranked_leaderboard.append(tmp)
        prev_score = entry[1]

    return ranked_leaderboard

def current_meal():
    def is_current_time_in_range(start_time, end_time):
        current_time = datetime.now().time()
        return start_time <= current_time <= end_time

    delay = -2
    # Example usage:
    BF_start = time(4 + delay, 0)  # 8:00 AM
    BF_end = time(11 + delay, 30)  # 5:00 PM
    
    LU_start = time(11 + delay, 30)  # 8:00 AM
    LU_end = time(17 + delay, 0)  # 5:00 PM
    
    DI_start = time(17 + delay, 0)  # 8:00 AM
    DI_end = time(23 + delay, 0)  # 5:00 PM

    if is_current_time_in_range(BF_start, BF_end):
        return 1
    elif is_current_time_in_range(LU_start, LU_end):
        return 2
    elif is_current_time_in_range(DI_start, DI_end):
        return 3
    else:
        return 0
