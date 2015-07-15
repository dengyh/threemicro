 # -*- coding: utf-8 -*-
from django.contrib.auth.models import User
from student.models import Student
from committee.models import Committee, Teacher
from principal.models import Principal

from django.template import RequestContext

def getInformation(request):
    if request.user is None:
        return {}

    if request.user.first_name == 'student':
        return getStudentInformation(request)

    if request.user.first_name == 'teacher':
        return getTeacherInformation(request)

    if request.user.first_name == 'principal':
        return getPrincipalInformation(request)

    if request.user.first_name == 'committee':
        return getCommitteeInformation(request)

    return {}

def getStudentInformation(request):
    try:
        student = Student.objects.get(user = request.user)
        return {
            'name' : student.name,
            'email' : student.email,
            'phone' : student.phone,
            'college' : student.college,
            'grade' : student.grade,
            'gender' : student.gender,
            'sno' : student.sno,
            'societies' : student.societies,
            'type' : 'student',
        }
    except:
        return {
            'name' : '',
            'email' : '',
            'phone' : '',
            'college' : '',
            'grade' : '',
            'gender' : '',
            'sno' : '',
            'societies' : '',
            'type' : 'student',
        }

def getTeacherInformation(request):
    try:
        teacher = Teacher.objects.get(user = request.user)
        return {
            'tno' : teacher.tno,
            'name' : teacher.name,
            'email' : teacher.email,
            'phone' : teacher.phone,
            'gender' : teacher.gender,
            'work' : teacher.work,
            'wageNumber' : teacher.wageNumber,
            'type' : 'teacher',
        }
    except:
        return {
            'tno' : '',
            'name' : '',
            'email' : '',
            'phone' : '',
            'gender' : '',
            'work' : '',
            'wageNumber' : '',
            'teacher' : 'teacher',
        }

def getCommitteeInformation(request):
    try:
        committee = Committee.objects.get(user = request.user)
        return {
            'name' : committee.name,
            'email' : committee.email,
            'phone' : committee.phone,
            'wageNumber' : committee.wageNumber,
            'type' : 'committee',
        }
    except:
        return {
            'name' : '',
            'email' : '',
            'phone' : '',
            'wageNumber' : '',
            'type' : 'committee',
        }

def getPrincipalInformation(request):
    try:
        principal = Principal.objects.get(user = request.user)
        return {
            'name' : principal.name,
            'email' : principal.email,
            'phone' : principal.phone,
            'wageNumber' : principal.wageNumber,
            'type' : 'principal',
        }
    except:
        return {
            'name' : '',
            'email' : '',
            'phone' : '',
            'wageNumber' : '',
            'type' : 'principal',
        }