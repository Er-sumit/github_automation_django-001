from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def luck_form(request):
    return render(request, 'luck-form.html')

def luck_result(request):
    name=f"Hello, {request}"
    if request.method == 'POST':
        name = request.POST['name']
    return HttpResponse(f'{name} You are lucky')