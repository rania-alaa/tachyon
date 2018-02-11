from django.db import models
from django.contrib.auth.models import User

class books(models.Model):
    users = models.ManyToManyField('User', through="book_user")

    name = models.CharField(max_length=500)
    type = models.CharField(max_length=100)
    picture = models.CharField(max_length=500)
    summary = models.CharField(max_length=500)

class author(models.Model):
    Books = models.ManyToManyField('books')

    name = models.CharField(max_length=250)
    date_of_birth = models.CharField(max_length=250)
    nationality = models.CharField(max_length=50)
    gender = models.CharField(max_length=10)
    picture = models.CharField(max_length=500)

class category(models.Model):
    Books = models.ManyToManyField('books')

    type = models.CharField(max_length=100)

class book_user(models.Model):
    Book = models.ForeignKey(books, on_delete=models.CASCADE)
    user = models.ForeignKey(users, on_delete=models.CASCADE)

    review = models.CharField(max_length=500)
    rate = models.CharField(max_length=500)
    status = models.CharField(max_length=500)

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    picture = models.ImageField(max_length=500)