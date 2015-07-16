# -*- coding: utf-8 -*-
import xadmin
from xadmin import views

from xadmin.layout import Main, TabHolder, Tab, Fieldset, Row, Col, AppendedText, Side
from xadmin.plugins.inline import Inline
from xadmin.plugins.batch import BatchChangeAction

from principal.models import Principal

class PrincipalAdmin(object):
    list_display = ('campus', 'email', 'phone')

xadmin.site.register(Principal, PrincipalAdmin)