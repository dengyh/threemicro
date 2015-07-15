# -*- coding: utf-8 -*-
import xadmin
from xadmin import views

from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

from feedback.models import Feedback

class FeedbackAdmin(object):
    list_display = ('netid', 'content', 'datetime', 'campus', 'name', 'phone', 'email')

xadmin.site.register(Feedback, FeedbackAdmin)