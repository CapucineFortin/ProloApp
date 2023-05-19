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

    def get_score_categories(self):
            return [i-1 for i in list(self.score.values_list('category', flat=True).distinct())]

class Score(models.Model):
    class PointType(models.IntegerChoices):
        KERMESSE    = 1, 'Kermesse'
        CHAISES     = 2, 'Chaises-Musicales'
        GONFLABLE   = 3, 'Gonflable'
        BLINDTEST   = 4, 'Blindtest'
        KARAOKE     = 5, 'Karaoke'
        LOUPGAROU   = 6, 'Loup-Garou'
        MAQUILLAGE  = 7, 'Maquillage'
        CHASSE_TRESOR = 8, 'Chasse-au-tresor'
        CHASSE_ORGAS = 9, 'Chasse-aux-Orgas'
        JEUX_VIDEOS = 10, 'Jeux-Videos'
        QPUP        = 11, 'Question-Pour-un-Prolo'
        MISC        = 12, 'Misc'

    score_id = models.AutoField(primary_key=True)
    contestant = models.ForeignKey(Contestant, on_delete=models.CASCADE, related_name='score')
    points = models.IntegerField(default=0)
    category = models.IntegerField(choices=PointType.choices)

class Meal(models.Model):
    class MealType(models.IntegerChoices):
        BREAKFAST   = 1, 'Breakfast'
        LUNCH       = 2, 'Lunch'
        DINNER      = 3, 'Dinner'
        OTHER       = 0, 'Other'

    meal_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(ProloginUser, on_delete=models.CASCADE, related_name='meal')
    day = models.IntegerField(default=0) # 0 = jeudi, 1 = vendredi, ...
    meal_type = models.IntegerField(choices=MealType.choices)
    eaten = models.BooleanField(default=False)

    @classmethod
    def count_matching_meals(cls, day, meal_type, eaten):
        return cls.objects.filter(day=day, meal_type=meal_type, eaten=eaten).count()
