from django.urls import path
from . import views

app_name = 'finale'

urlpatterns = [
    path('contestant/<str:username>/', views.get_contestant, name='get_contestant'),
    path('contestants/', views.get_contestants, name='get_contestants'),
    path('leaderboard/', views.leaderboard, name='leaderboard'),
    path('houses/<str:house_name>/', views.get_house_contestants, name='get_house_contestants'),
    path('houses/', views.get_houses, name='get_houses'),
    path('score/<str:username>/', views.set_score, name='set_contestant_score'),
]