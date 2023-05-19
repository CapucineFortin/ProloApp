# Generated by Django 3.2.5 on 2023-05-18 16:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Contestant',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('house', models.IntegerField(choices=[(1, 'Gryffindor'), (2, 'Ravenclaw'), (3, 'Slytherin'), (4, 'Hufflepuff'), (5, 'Test')], default=1)),
                ('rank_checkpoint', models.IntegerField(default=1)),
            ],
        ),
        migrations.CreateModel(
            name='Meal',
            fields=[
                ('meal_id', models.AutoField(primary_key=True, serialize=False)),
                ('day', models.IntegerField(default=0)),
                ('meal_type', models.IntegerField(choices=[(1, 'Breakfast'), (2, 'Lunch'), (3, 'Dinner'), (0, 'Other')])),
                ('eaten', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Score',
            fields=[
                ('score_id', models.AutoField(primary_key=True, serialize=False)),
                ('points', models.IntegerField(default=0)),
                ('category', models.IntegerField(choices=[(1, 'Animation'), (2, 'Kermesse'), (3, 'Chaises-Musicales'), (4, 'Gonflable'), (5, 'Blindtest'), (6, 'Karaoke'), (7, 'Loup-Garou'), (8, 'Maquillage'), (9, 'Chasse-au-tresor'), (10, 'Chasse-aux-Orgas'), (11, 'Jeux-Videos'), (12, 'Question-Pour-un-Prolo'), (13, 'Misc')])),
                ('contestant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='score', to='finale.contestant')),
            ],
        ),
    ]
