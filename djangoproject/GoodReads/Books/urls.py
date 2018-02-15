from django.conf.urls import include, url
from django.urls import path, re_path
from Books import views


urlpatterns = [
    path("users/", views.users),
    re_path('^search/$',views.search,name='search'),
]