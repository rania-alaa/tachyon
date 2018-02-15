from django.http import HttpResponse
from django.shortcuts import render, redirect
from Books.models import *



def users(request):
    user = Profile.objects.get(user=request.user.id)
    user.name = request.user.first_name + " " + request.user.last_name
    booksReview = book_user.objects.filter(user=request.user.id)
    books = [book.Book for book in booksReview]

    for i in range(len(books)):
        books[i].review = booksReview[i].review
        books[i].rate = booksReview[i].rate
        books[i].status = booksReview[i].status

    return render(request, 'users.html/' ,{'books' : books, 'user' : user})


def search(request):
    if request.method == 'GET':
        searchText = request.GET.get("search")
        books_list = books.objects.filter(name__icontains=searchText)
        authors_list = author.objects.filter(name__icontains=searchText)
        return render(request,'search.html',{'books_list':books_list,'authors_list':authors_list})
