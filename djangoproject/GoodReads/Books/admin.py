from django.contrib import admin
from Books import models

admin.site.register(models.Profile)
admin.site.register(models.books)
admin.site.register(models.author)
admin.site.register(models.category)