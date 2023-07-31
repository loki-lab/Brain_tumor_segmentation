# //myapp/forms.py
from typing import Type

from django import forms
from myapp.models import Employee, comment, doctor, patient
class EmployeeForm(forms.ModelForm):
    class Meta:
        model: Type[Employee] = Employee

        fields = ['name', 'contact', 'email', 'venue_image']

        widgets = { 'name': forms.TextInput(attrs={ 'class': 'form-control' }),
            'email': forms.EmailInput(attrs={ 'class': 'form-control' }),
            'contact': forms.TextInput(attrs={ 'class': 'form-control' }),

      }
class CommentForm(forms.ModelForm):

    class Meta:
        model: Type[comment] = comment
        fields = '__all__'
        widgets = {
            'Date': forms.DateInput(attrs={'type': 'date'}),
        }


class DoctorFrom(forms.ModelForm):
    class Meta:
        model: Type[doctor] = doctor
        fields = '__all__'
        widgets = {

        }

class PatientForm(forms.ModelForm):

    class Meta:

        model: Type[patient] = patient
        fields = '__all__'
        widgets = {
            'DateOfBirth': forms.DateTimeInput(attrs={'type': 'date'}),
            'ExamDate': forms.DateTimeInput(attrs={'type': 'date'}),

        }