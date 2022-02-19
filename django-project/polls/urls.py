from django.urls import path
from . import views

urlpatterns = [
    path('', views.luck_form, name="luck_form"),
    path('luck_result/',views.luck_result, name="luck_result"),
]
