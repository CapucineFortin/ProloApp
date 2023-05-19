
from django_cron import CronJobBase, Schedule
from .models import Contestant
from .utils import compute_leaderboard

class UpdateCheckpointCronJob(CronJobBase):
    RUN_EVERY_MINS = 30  # Run every 30 minutes

    schedule = Schedule(run_every_mins=RUN_EVERY_MINS)
    code = 'finale.update_checkpoint_cron_job'  # Unique identifier

    def do(self):
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