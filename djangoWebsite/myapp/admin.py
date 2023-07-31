from django.contrib import admin
from .models import Employee, doctor, receptionist, patient, comment, Profile

# Register your models here.
admin.site.register(Employee)
admin.site.register(Profile)
admin.site.register(doctor)
admin.site.register(receptionist)
admin.site.register(patient)
admin.site.register(comment)