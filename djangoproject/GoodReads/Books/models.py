from django.db import models
from django.contrib.auth.models import User

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    picture = models.ImageField(upload_to="users", null=True, blank=True)

class author(models.Model):
    name = models.CharField(max_length=250)
    date_of_birth = models.CharField(max_length=250)
    nationality = models.CharField(max_length=50)
    gender = models.CharField(max_length=10)
    picture = models.ImageField(upload_to="authors", null=True, blank=True)
    is_followed=models.BooleanField(default=False)


    def __str__(self):
        return self.name

class books(models.Model):
    users = models.ManyToManyField('Profile', through='book_user')
    author_id = models.ForeignKey(author, on_delete=models.CASCADE)

    name = models.CharField(max_length=500)
    type = models.CharField(max_length=100)
    picture = models.ImageField(upload_to="books", null=True, blank=True)
    summary = models.CharField(max_length=500)
    is_favorite=models.BooleanField(default=False)


    def __str__(self):
        return self.name

class category(models.Model):
    Books = models.ManyToManyField('books')

    type = models.CharField(max_length=100)


    def __str__(self):
        return self.type

class book_user(models.Model):
    Book = models.ForeignKey(books, on_delete=models.CASCADE)
    user = models.ForeignKey(Profile, on_delete=models.CASCADE)

    review = models.CharField(max_length=500)
    rate = models.CharField(max_length=500)
    status = models.CharField(max_length=500)

    def __str__(self):
        return self.user
