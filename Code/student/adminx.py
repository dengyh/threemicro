# -*- coding: utf-8 -*-
import xadmin
from xadmin import views

from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

from student.models import Student

class StudentAdmin(object):
    list_display = ('netid', 'name', 'email', 'phone')

xadmin.site.register(Student, StudentAdmin)