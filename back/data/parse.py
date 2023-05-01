import csv
from users_manager.models import User
from finale.models import Contestant, House
import random

def import_all():
    houses = ["Gryffindor", "Slytherin", "Ravenclaw", "Hufflepuff"]
    for house in houses:
        House.objects.get_or_create(name=house)

    with open('data/contestants.csv', newline='') as csvfile:
        reader=csv.DictReader(csvfile, fieldnames=['username', 'lastname', 'firstname', 'is_staff'])
        for row in reader:
            user = User.objects.create(username=row['username'],
                                        first_name= row["firstname"],
                                        last_name= row["lastname"],
                                        email = f'{row["username"]}@contest.idk',
                                        is_staff = row["is_staff"])
            if row["is_staff"] == "0":
                house, _ = House.objects.get_or_create(name=houses[random.randint(0, 3)])
                contestant = Contestant.objects.create(user=user, house=house, score=0, rank_checkpoint=1)
                contestant.save()