import csv
from users_manager.models import ProloginUser
from finale.models import Contestant
import random

def go():
    with open('data/contestants.csv', newline='') as csvfile:
        reader=csv.DictReader(csvfile, fieldnames=['login', 'lastname', 'firstname'])
        for row in reader:
            user = ProloginUser.objects.create(username=row['login'],
                                        first_name= row["firstname"],
                                        last_name= row["lastname"],
                                        email = f'{row["login"]}@prologin.dog',
                                        is_staff = False)
            contestant = Contestant.objects.create(user=user, house=random.randint(1, 4), rank_checkpoint=1)
            contestant.save()

    with open('data/orgas.csv', newline='') as csvfile:
        reader=csv.DictReader(csvfile, fieldnames=['login', 'lastname', 'firstname'])
        for row in reader:
            user = ProloginUser.objects.create(username=row['login'],
                                        first_name= row["login"],
                                        last_name= row["lastname"],
                                        email = f'{row["login"]}@prologin.org',
                                        is_staff = True)
