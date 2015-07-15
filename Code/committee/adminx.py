# -*- coding: utf-8 -*-
import xadmin
from xadmin import views

from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

from committee.models import Committee, Societies, TableSet, Teacher

class CommitteeAdmin(object):
    list_display = ('campus', 'email', 'phone')

class SocietiesAdmin(object):
    list_display = ('name', 'committee')
    search_fields = ('name')
    

class TableSetAdmin(object):
    list_display = ('description', 'committee', 'file')

class TeacherAdmin(object):
    list_display = ('tno', 'name', 'email', 'phone', 'committee', 'societies')

xadmin.site.register(Committee, CommitteeAdmin)
xadmin.site.register(Societies, SocietiesAdmin)
xadmin.site.register(TableSet, TableSetAdmin)
xadmin.site.register(Teacher, TeacherAdmin)