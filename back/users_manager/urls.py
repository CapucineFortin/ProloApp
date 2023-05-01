from django.urls import path
from . import views

app_name = 'users_manager'

urlpatterns = [
    path('user/<str:login>', views.get_users, name='get_user'),
    path('users/', views.get_users, name='get_users'),
]