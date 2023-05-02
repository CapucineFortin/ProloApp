from django.db import models
from django.contrib.auth.models import AbstractUser
from users_manager.models import User

class House(models.Model):
    name = models.CharField(max_length=10)
    members = models.ManyToManyField(User, related_name='houses')

    def __str__(self):
        return self.name

    def total_score(self):
        return sum([c.score for c in self.contestant_set.all()])

class Contestant(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='contestant')
    house = models.ForeignKey(House, on_delete=models.CASCADE)
    score = models.IntegerField(default=0)
    rank_checkpoint = models.IntegerField(default=1)