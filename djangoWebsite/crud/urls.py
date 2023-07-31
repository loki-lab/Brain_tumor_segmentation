"""crud URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
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
from django.urls import path, include
from django.contrib.auth import views as auth_view
from myapp import views
from django.conf import settings
from django.urls import path
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls),
    path('', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),

    path('index/', views.das, name='das'),
    path('doc/', views.doc, name='doc'),
# --------------------comment---------------------------

    path('addnewpati/',views.addnewpati, name='addnewpati'),
    path('com/',views.detals, name='details'),
    path('com/update/<int:pk>/', views.comment_update, name='comment_update'),
    path('com/delete/<int:pk>/', views.comment_delete, name='comment_delete'),
# ----------------------------Patient--------------------------------
    path('pati/', views.ttpati, name='pati'),
    path('patientnew/', views.patientnew, name='patientnew'),
    path('pati/update/<int:pk>/', views.patient_update, name='patient_update'),
    path('pati/del/<int:pk>/', views.patient_del, name='patient_del'),


#     -------API---------
    path('', include('myapp.urls')),



] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
