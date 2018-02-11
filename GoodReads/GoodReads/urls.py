
from django.contrib import admin
from django.conf.urls import include, url

urlpatterns = [
    url('Books/', include('Books.urls')),
    url('admin/', admin.site.urls),
]
