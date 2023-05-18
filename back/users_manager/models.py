from django.db import models
from django.contrib.auth.models import AbstractUser

class ProloginUser(AbstractUser):
    is_staff = models.BooleanField(default=False)