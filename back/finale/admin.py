from django.contrib import admin
from .models import Contestant, Score, Meal

class ContestantAdmin(admin.ModelAdmin):
    list_filter = ('house',)
    list_display = ('contestant', 'house')

    def contestant(self, obj):
        return (obj.user.username)
    
class MealAdmin(admin.ModelAdmin):
    list_filter = ('day', 'meal_type', 'eaten', 'user__is_staff')
    list_display = ('get_username', 'day', 'meal_type', 'eaten')
    
    @admin.display(ordering='user__name', description='User name')
    def get_username(self, obj):
        return obj.user.username
    
class ScoreAdmin(admin.ModelAdmin):
    list_filter = ('category', 'contestant__house')
    list_display = ('get_contestant_name', 'get_contestant_house', 'category', 'points')
    
    @admin.display(ordering='score_id', description='Contestant user username')
    def get_contestant_name(self, obj):
        return obj.contestant.user.username
    
    @admin.display(ordering='score_id', description='Contestant house')
    def get_contestant_house(self, obj):
        return obj.contestant.get_house_display()

admin.site.register(Contestant, ContestantAdmin)
admin.site.register(Score, ScoreAdmin)
admin.site.register(Meal, MealAdmin)