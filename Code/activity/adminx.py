# -*- coding: utf-8 -*-
import xadmin
from xadmin import views

from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

from activity.models import Activity, Submission, Registrant, Location, Occupation, Number, LimitNumber

class ActivityAdmin(object):
    list_display = ('title', 'status', 'campus', 'type', 'student', 'teacher')

class SubmissionAdmin(object):
    list_display = ('type', 'file', 'activity', 'location', 'number')

class RegistrantAdmin(object):
    list_display = ('netid', 'activity', 'isPass', 'time')

class LocationAdmin(object):
    list_display = ('name', 'campus')

class OccupationAdmin(object):
    list_display = ('location', 'activity', 'startTime', 'endTime')

class NumberAdmin(object):
    list_display = ('campus', 'desk', 'beachDesk', 'tent')

class LimitNumberAdmin(object):
    list_display = ('campus', 'desk', 'beachDesk', 'tent')

xadmin.site.register(Activity, ActivityAdmin)
xadmin.site.register(Submission, SubmissionAdmin)
xadmin.site.register(Registrant, RegistrantAdmin)
xadmin.site.register(Location, LocationAdmin)
xadmin.site.register(Occupation, OccupationAdmin)
xadmin.site.register(Number, NumberAdmin)
xadmin.site.register(LimitNumber, LimitNumberAdmin)