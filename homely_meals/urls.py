"""homely URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('',views.log),
    path('log_post',views.log_post),
    path('food_add',views.food_add),
    path('foodadd_post',views.foodadd_post),
    path('view_food',views.view_food),
    path('adm',views.adm),
    path('view_food',views.view_food),
    path('food_update/<id>',views.food_update),
    path('update_post/<id>',views.update_post),
    path('food_delete/<id>',views.food_delete),
    path('view_feedback',views.view_feedback),
    path('view_Registered_Food_providers_approve_reject',views.view_Registered_Food_providers_approve_reject),
    path('view_approved_food_provider',views.view_approved_food_provider),
    path('food_provider_approve/<id>',views.food_provider_approve),
    path('food_provider_delete/<id>', views.food_provider_delete),
    path('logout',views.logout),
    path('provider',views.provider),
    path('profile',views.profile),
    path('food_management',views.food_management),
    path('food_management_post',views.food_management_post),
    path('registers',views.registers),
    path('registers_post',views.registers_post),
    path('food_view',views.food_view),
]
