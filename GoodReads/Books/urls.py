from django.conf.urls import include, url
from django.urls import path
from Books import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
]