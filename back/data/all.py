from data.parse import go
from data.meals import contestants, orgas
from finale.models import Meal

def all():
    go()
    contestants(0, 3)

def meals():
    Meal.objects.all().delete()
    contestants(day=0, meal_type=3)
    orgas(day=0, meal_type=3)