from django.http import HttpResponse
from django.shortcuts import render,get_object_or_404,redirect ,redirect
from Books.models import *
from Books.forms import LoginForm

def index(request):
    #return HttpResponse("<h1> this is Books HomePage")
    return render(request, 'startUpPage.html' ,{})

def login(request,user_id):
	username=""
	if request.method=="POST":
		MyLoginForm=LoginForm(request.POST)
		username=request.POST.get('username')
		password=request.POST.get('password')
		
	users=User.objects.filter()
	
	for user in users:
		
		if user.username==username and user.check_password(password):
			
			return render(request,'users.html',{"user":user,"books":{}})	
	return render(request,'startUpPage.html',{})	
	

	
def users(request,user_id):
    # user = Profile.objects.get(user=request.user.id)
    user = Profile.objects.get(pk=user_id)
    booksReview = book_user.objects.filter(pk=user_id)
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

def allauthors(request):
    all_authors=author.objects.all();
    return render(request,'allauthor.html',{'all_authors': all_authors ,})


def authordetail(request,author_id):
    bookss=books.objects.filter(author_id=author_id)
    authorr=get_object_or_404(author,pk=author_id)
    return render(request,'authordetails.html',{'author': authorr ,'bookss':bookss})



def favorite(request,author_id):
    authorr=get_object_or_404(author,pk=author_id)
    bookss=books.objects.filter(author_id=author_id)
    try:
        selected_book=books.objects.get(pk=request.POST['bookk'])
    except (KeyError,books.DoesNotExist):
        return render(request,'authordetails.html',{'author': authorr ,'bookss':bookss ,'error_message':"You did not select a valid book",})
    else:
        selected_book.is_favorite = True
        selected_book.save()
        return render(request,'authordetails.html',{'author': authorr,'bookss':bookss ,})


def allbooks(request):
    all_books=books.objects.all();
    return render(request,'allbooks.html',{'all_books': all_books ,})
def book(request,number):
	selectedBook=books.objects.get(id=number)
	authors=author.objects.get(name=selectedBook.author_id)
	bookCategory=selectedBook.category_set.all()
	return render(request,'Books_page.html',{'selectedBook':selectedBook,'authors':authors,'bookCategory':bookCategory},)
def categories(request,categoryId):
	selectedBook=books.objects.all()
	selectedCategory=[]
	categoryName=""
	for book in selectedBook:
		for cat in book.category_set.all():
			if cat.id==int(categoryId):
				categoryName=cat
				selectedCategory.append(book)
	return render(request,'category.html',{'selectedCategory':selectedCategory,'categoryName':categoryName},)
	
