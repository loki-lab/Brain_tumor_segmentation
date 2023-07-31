from django.db import models
from datetime import datetime, date
from django.contrib.auth.models import User


# Create your models here.

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_image = models.ImageField(upload_to='media/', null=True, blank=True)

    def __str__(self):
        return self.user.username


class Employee(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    contact = models.CharField(max_length=15)
    venue_image = models.ImageField(null=True, blank=True, upload_to="images/")

    class Meta:
        db_table = "tblemployee"


class doctor(models.Model):
    name = models.CharField(max_length=30)
    NameLogin = models.CharField(max_length=255)
    Password = models.CharField(max_length=20)
    Faculty = models.CharField(max_length=255)
    Image = models.ImageField(null=True, blank=True, upload_to='docterImages/')

    def __str__(self):
        return self.NameLogin


class patient(models.Model):
    Name = models.CharField(max_length=30)
    DoctorID = models.ForeignKey(doctor, on_delete=models.CASCADE)
    DateOfBirth = models.DateField(null=True)
    images = models.ImageField(null=True, blank=True, upload_to='PatientImages/')
    ExamDate = models.DateField()

    # class Meta:
    #     db_table = "tbpatient"
    def __str__(self):
        return self.Name


class receptionist(models.Model):
    Name = models.CharField(max_length=30)
    Password = models.CharField(max_length=20)
    NameLogin = models.CharField(max_length=15)

    def __str__(self):
        return self.Name
    #
    # class Meta:
    #     db_table = "tbreceptionist"


class comment(models.Model):
    NameOfDisease = models.CharField(max_length=255)
    PatientID = models.ForeignKey(patient, on_delete=models.CASCADE)
    DoctorID = models.ForeignKey(doctor, on_delete=models.CASCADE)
    InputImage = models.ImageField(null=True, upload_to='InputImages/', blank=True)
    OutputImage = models.ImageField(null=True, upload_to='OutputImages/', blank=True)
    ResultByDoctor = models.TextField()

    def __str__(self):
        return self.NameOfDisease

    # class Meta:
    #     db_table = "tbcomment"


class diseases(models.Model):
    NameDiseases = models.CharField(max_length=255)
    DoctorID = models.ForeignKey(doctor, on_delete=models.CASCADE)
# Create your models here.
