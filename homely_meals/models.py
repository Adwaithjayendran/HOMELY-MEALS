from django.db import models

# Create your models here.

class login(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=20)
    usertype = models.CharField(max_length=20)

class food_provider(models.Model):
    provider_name = models.CharField(max_length=50)
    building_name = models.CharField(max_length=100)
    buiding_no = models.CharField(max_length=20)
    street = models.CharField(max_length=100)
    longitude = models.CharField(max_length=20)
    latitude = models.CharField(max_length=20)
    phone_no = models.CharField(max_length=12)
    email = models.CharField(default=1, max_length=100)
    LOGIN=models.ForeignKey(login,default=1,on_delete=models.CASCADE)

class user(models.Model):
    username = models.CharField(max_length=20)
    house_name = models.CharField(max_length=50)
    street = models.CharField(max_length=100)
    email_id = models.CharField(max_length=50)
    phone_number = models.CharField(max_length=50)
    LOGIN=models.ForeignKey(login,default=1,on_delete=models.CASCADE)


class food(models.Model):
    food_name = models.CharField(max_length=20)

class feedback(models.Model):
    feedback = models.CharField(max_length=200)
    date = models.CharField(max_length=20)
    USER = models.ForeignKey(user,on_delete=models.CASCADE,default=1)           # foreign key setup


class food_items(models.Model):
    FOOD = models.ForeignKey(food,on_delete=models.CASCADE,default=1)
    amount = models.CharField(max_length=20)
    photo = models.CharField(max_length=200)
    FOOD_PROVIDER = models.ForeignKey(food_provider,on_delete=models.CASCADE,default=1)

class order_master(models.Model):
    user_id = models.CharField(max_length=20)
    amount = models.CharField(max_length=20)
    date = models.CharField(max_length=20)
    status = models.CharField(default=1, max_length=100)

class order(models.Model):
    FOOD_ITEMS = models.ForeignKey(food_items,on_delete=models.CASCADE,default=1)
    quantity = models.CharField(max_length=20)
    ORDER_MASTER = models.ForeignKey(order_master,on_delete=models.CASCADE,default=1)

class bank(models.Model):
    bank_name = models.CharField(max_length=50)
    ifsc_code = models.CharField(max_length=20)
    amount = models.CharField(max_length=20)
    LOGIN = models.ForeignKey(login,on_delete=models.CASCADE,default=1)

class cart(models.Model):
    FOOD_ITEMS = models.ForeignKey(food_items,on_delete=models.CASCADE,default=1)
    quantity = models.CharField(max_length=20)
    USER = models.ForeignKey(user,on_delete=models.CASCADE,default=1)


