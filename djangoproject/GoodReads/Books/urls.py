from django.conf.urls import include, url
from django.urls import path, re_path
from Books import views
from django.views.generic import ListView,TemplateView
from . import views

app_name ='Books'

urlpatterns = [
     url(r'^users/(?P<user_id>[0-9]+)/$', views.users),
    re_path('^search/$',views.search,name='search'),
    path('Books/Author/', views.allauthors, name='allauthors'),
    path('Books/Books/', views.allbooks, name='allbooks'),
    url(r'^Books/Books/(?P<number>[0-9])+/$',views.publicBook,name='bookForAll'),
    url(r'^Books/Books/(?P<number>[0-9])+/(?P<user_id>[0-9])+/$',views.book,name='book'),
	#url(r'^Books/Books/(?P<number>[0-9])+/$',views.book,name='book'),
	url(r'^Books/Books/category/(?P<categoryId>[0-9])+/$',views.categories,name='categories'),
    url(r'^Books/(?P<author_id>[0-9]+)/$', views.authordetail, name='authordetail'),
    url(r'^$', views.index, name='index'),
    url(r'^(?P<user_id>)/$',views.login,name='myurl'),
    url(r'^Books/(?P<author_id>[0-9]+)/favorite$', views.favorite, name='favorite'),
	
]
