# Generated by Django 4.2 on 2023-04-26 10:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users_manager', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='user',
            name='name',
        ),
    ]