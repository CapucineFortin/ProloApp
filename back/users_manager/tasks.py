from celery import shared_task
from django.core.management import call_command

# The decorator is used to mark this function as a Celery task
@shared_task
def update_rank_checkpoint():
    call_command('update_rank_checkpoint')
