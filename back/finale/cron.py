
from .models import Contestant
from .utils import compute_leaderboard

def updateCheckpointCronJob():
    leaderboard = compute_leaderboard()

    # Update the rank_checkpoint field for each contestant
    for index, entry in enumerate(leaderboard):
        username = entry['username']
        rank = entry['rank']
        try:
            contestant = Contestant.objects.get(user__username=username)
            contestant.rank_checkpoint = rank
            contestant.save()
        except Contestant.DoesNotExist:
            # Handle the case where the contestant does not exist
                continue