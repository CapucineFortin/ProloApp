from users_manager.models import ProloginUser
from finale.models import Meal
import csv

def contestants(day=0, meal_type=3):
    with open('data/contestants.csv', newline='') as csvfile:
        reader=csv.DictReader(csvfile, fieldnames=['login', 'lastname', 'firstname'])
        for row in reader:
            try:
                user = ProloginUser.objects.get(username=row['login'])
                meal = Meal.objects.create(user=user, day=day, meal_type=meal_type)
                meal.save()
            except ProloginUser.DoesNotExist:
                print(row['login'])
                continue

def orgas(day=0, meal_type=3):
    with open('data/orgas_meal.csv', newline='') as csvfile:
        reader=csv.DictReader(csvfile, fieldnames=['login', 'lastname', 'firstname', 'eating'])
        for row in reader:
            if row['eating'] == "OUI":
                try:
                    user = ProloginUser.objects.get(username=row['login'])
                    meal = Meal.objects.create(user=user, day=day, meal_type=meal_type)
                    meal.save()
                except:
                    print(row['login'])
                    continue