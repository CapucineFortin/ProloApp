from django.contrib import admin
from .models import Contestant, Score, Meal

class ContestantAdmin(admin.ModelAdmin):
    list_filter = ('house',)
    list_display = ('contestant', 'house')

    def contestant(self, obj):
        return (obj.user.username)

admin.site.register(Contestant, ContestantAdmin)
admin.site.register(Score)
admin.site.register(Meal)