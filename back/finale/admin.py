from django.contrib import admin
from .models import Contestant, House

class ContestantAdmin(admin.ModelAdmin):
    list_filter = ('house',)
    list_display = ('contestant', 'house', 'score')

    def contestant(self, obj):
        return (obj.user.username)

admin.site.register(Contestant, ContestantAdmin)
admin.site.register(House)