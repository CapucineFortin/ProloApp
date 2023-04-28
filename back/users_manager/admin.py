from django.contrib import admin
from .models import User, House, Contestant

admin.site.register(User)
admin.site.register(House)
admin.site.register(Contestant)