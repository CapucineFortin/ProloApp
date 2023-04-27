from django.urls import path
from . import views

app_name = 'users_manager'

urlpatterns = [
    path('contestant/<str:username>/', views.get_contestant, name='get_contestant'),
    path('setcontestant/<str:username>/', views.set_contestant_score, name='set_contestant_score'),
    path('contestants/', views.get_contestants, name='get_contestants'),
    path('house/<str:house_name>/contestants', views.get_house_contestants, name='get_house_contestants'),
    path('houses/', views.get_houses, name='get_houses'),
    path('users/', views.get_users, name='get_users'),
]