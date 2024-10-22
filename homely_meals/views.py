import datetime

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render, redirect
from .models import *

# Create your views here.

# def student(request):
#     return HttpResponse("ok")

def log(request):
    return render(request,'login.html')

def log_post(request):
    un = request.POST['textfield']
    ps = request.POST['textfield2']

    res=login.objects.filter(username=un,password=ps)
    if res.exists():
        if res[0].usertype=='admin':
            request.session['lid'] = res[0].id
            return HttpResponse("<script>alert('success');window.location='/adm'</script>")
        if res[0].usertype=='food_provider':
            request.session['lid'] = res[0].id
            return HttpResponse("<script>alert('success');window.location='/provider'</script>")
        else:
            return HttpResponse("<script>alert('invalid');window.location='/log'</script>")
    else:
            return HttpResponse("<script>alert('unauthorized user');window.location='/log'</script>")

def logout(request):
    request.session['lid'] = "out"
    return HttpResponse("<script>alert('logout');window.location='/'</script>")

def adm(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        return render(request,'admin/admin_home.html')


def food_add(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        return render(request,'admin/food_add.html')

def foodadd_post(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        foodnam = request.POST['textfield']
        obj = food()
        obj.food_name = foodnam
        obj.save()
        return HttpResponse("<script>alert('added');window.location='/food_add'</script>")
def view_food(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        res=food.objects.all()
        return render(request,'admin/view_food.html',{'data':res})
def food_update(request,id):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        res=food.objects.get(id=id)
        return render(request,'admin/food_update.html',{'data':res})

def update_post(request,id):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        foodname = request.POST['textfield']
        food.objects.filter(id=id).update(food_name=foodname)
        return HttpResponse("<script>alert('updated');window.location='/food_add'</script>")

def food_delete(request,id):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        food.objects.get(id=id).delete()
        return HttpResponse("<script>alert('deleted');window.location='/view_food'</script>")



def view_feedback(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        res=feedback.objects.all()
        return render(request,'admin/view_feedback.html',{'data':res})

def view_Registered_Food_providers_approve_reject(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        res=food_provider.objects.filter(LOGIN__usertype='pending')
        return render(request,'admin/view_Registered_Food_providers_approve_reject.html',{'data':res})

def food_provider_approve(request,id):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        login.objects.filter(id=id).update(usertype='food_provider')
        return HttpResponse("<script>alert('added');window.location='/view_approved_food_provider'</script>")

def food_provider_delete(request,id):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        login.objects.get(id=id).delete()
        return HttpResponse("<script>alert('deleted');window.location='/view_approved_food_provider'</script>")

def view_approved_food_provider(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        res=food_provider.objects.filter(LOGIN__usertype='food_provider')
        return render(request,'admin/view_approved_food_provider.html',{'data':res})



def provider(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        return render(request,'food_provider/provider_home.html')

def profile(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        return render(request, 'food_provider/profile.html')

def food_management(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        fd = food.objects.all()
        return render(request, 'food_provider/food_management.html', {'data': fd})

def food_management_post(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        fid = request.POST['select']
        amt = request.POST['textfield2']
        pic = request.FILES['fileField']
        dt = datetime.datetime.now().strftime('%Y%m%d-%H%M%S')
        fs = FileSystemStorage()
        fs.save(r'C:\Users\91790\PycharmProjects\homely\homely_meals\static\food item image\\'+dt+'.jpg', pic)
        img = "/static/food item image/"+dt+'.jpg'
        ob = food.objects.get(id=fid)
        print(ob, 'vwvurhveubet bv')

        obj = food_items()
        obj.FOOD = ob
        obj.FOOD_PROVIDER = food_provider.objects.get(LOGIN=request.session['lid'])
        obj.amount = amt
        obj.photo = img
        obj.save()
        return HttpResponse("<script>alert('added');window.location='/food_view'</script>")

def food_view(request):
    if request.session['lid'] == 'out':
        return HttpResponse("<script>alert('please login');window.location='/'</script>")
    else:
        itm = food_items.objects.filter(FOOD_PROVIDER__LOGIN=request.session['lid'])
        return render(request, 'food_provider/view_food.html', {'data': itm})




def registers(request):
    return render(request, 'food_provider/registers.html')

def registers_post(request):
    nme = request.POST['textfield']
    bdnme = request.POST['textfield2']
    bdno = request.POST['textfield3']
    strt = request.POST['textfield4']
    lgde = request.POST['textfield5']
    latde = request.POST['textfield6']
    phno = request.POST['textfield7']
    psw = request.POST['textfield8']

    obj1 = login()
    obj1.username = phno
    obj1.password = psw
    obj1.usertype = 'pending'
    obj1.save()

    obj = food_provider()
    obj.LOGIN = obj1
    obj.provider_name = nme
    obj.building_name = bdnme
    obj.buiding_no = bdno
    obj.street = strt
    obj.longitude = lgde
    obj.latitude = latde
    obj.phone_no = phno
    obj.save()
    return HttpResponse("<script>alert('registered');window.location='/'</script>")

# def add_food_item(request):
#     if request.session['lid'] == 'out':
#         return HttpResponse("<script>alert('please login');window.location='/'</script>")
#     else:
#         return render(request,'food_provider/view_food.html')








