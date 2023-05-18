from django.db import models
from users_manager.models import ProloginUser

class Contestant(models.Model):
    class House(models.IntegerChoices):
        GRYFFINDOR  = 1, 'Gryffindor'
        RAVENCLAW   = 2, 'Ravenclaw'
        SLYTHERIN   = 3, 'Slytherin'
        HUFFLEPUFF  = 4, 'Hufflepuff'
        TEST        = 5, 'Test'

    user = models.OneToOneField(ProloginUser, on_delete=models.CASCADE, related_name='contestant')
    house = models.IntegerField(choices=House.choices, default=1)
    rank_checkpoint = models.IntegerField(default=1)  
    
class Score(models.Model):
    class PointType(models.IntegerChoices):
        ANIMATION   = 1, 'Animation'
        KERMESSE    = 2, 'Kermesse'
        CHAISES     = 3, 'Chaises-Musicales'
        GONFLABLE   = 4, 'Gonflable'
        BLINDTEST   = 5, 'Blindtest'
        KARAOKE     = 6, 'Karaoke'
        LOUPGAROU   = 7, 'Loup-Garou'
        MAQUILLAGE  = 8, 'Maquillage'
        CHASSE_TRESOR = 9, 'Chasse-au-tresor'
        CHASSE_ORGAS = 10, 'Chasse-aux-Orgas'
        JEUX_VIDEOS = 11, 'Jeux-Videos'
        QPUP        = 12, 'Question-Pour-un-Prolo'
        MISC        = 13, 'Misc'

    contestant = models.ForeignKey(Contestant, on_delete=models.CASCADE, related_name='score')
    points = models.IntegerField(default=0)
    category = models.IntegerField(choices=PointType.choices)