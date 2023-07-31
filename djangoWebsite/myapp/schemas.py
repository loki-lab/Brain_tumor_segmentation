from ninja import ModelSchema
from .models import patient, doctor, comment


class PatientIn(ModelSchema):
    class Config:
        model = patient
        model_fields = ["id", 'Name', 'DoctorID', 'DateOfBirth', 'images', 'ExamDate']


class PatientOut(ModelSchema):
    class Config:
        model = patient
        model_fields = ["id", 'Name', 'DoctorID', 'DateOfBirth', 'images', 'ExamDate']


class DoctorIn(ModelSchema):
    class Config:
        model = doctor
        model_fields = ['id', 'name', 'NameLogin', 'Password', 'Faculty', 'Image']


class DoctorOut(ModelSchema):
    class Config:
        model = doctor
        model_fields = ['id', 'name', 'NameLogin', 'Password', 'Faculty', 'Image']


class CommentIn(ModelSchema):
    class Config:
        model = comment
        model_fields = ['id', 'NameOfDisease', 'PatientID', 'DoctorID', 'InputImage', 'OutputImage',
                        'ResultByDoctor']


class CommentOut(ModelSchema):
    class Config:
        model = comment
        model_fields = ['id', 'NameOfDisease', 'PatientID', 'DoctorID', 'InputImage', 'OutputImage',
                        'ResultByDoctor']
