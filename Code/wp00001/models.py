from django.db import models
import datetime
# Create your models here.

class Terms(models.Model):
    term_id = models.IntegerField(primary_key = True)
    name = models.CharField(max_length = 200)
    slug = models.CharField(max_length = 200)
    term_group = models.IntegerField(default = 0)

class Term_relationships(models.Model):
    object_id = models.IntegerField(primary_key = True)
    term_taxonomy_id = models.IntegerField()
    term_order = models.IntegerField(default = 0)

class Posts(models.Model):
    ID = models.IntegerField(primary_key = True)
    post_author = models.IntegerField(default = 0)
    post_date = models.DateTimeField(default = datetime.datetime(2014, 1, 1))
    post_date_gmt = models.DateTimeField(default = datetime.datetime(2014, 1, 1))
    post_content = models.TextField()
    post_title = models.TextField()
    post_excerpt = models.TextField()
    post_status = models.CharField(max_length = 20, default = 'publish')
    comment_status = models.CharField(max_length = 20, default = 'open')
    ping_status = models.CharField(max_length = 20, default = 'open')
    post_password = models.CharField(max_length = 20)
    post_name = models.CharField(max_length = 200)
    to_ping = models.TextField()
    pinged = models.IntegerField(default = 0)
    post_modified = models.DateTimeField(default = datetime.datetime(2014, 1, 1))
    post_modified_gmt = models.DateTimeField(default = datetime.datetime(2014, 1, 1))
    post_content_filtered = models.TextField()
    post_parent = models.IntegerField(default = 0)
    guid = models.CharField(max_length = 20)
    menu_order = models.IntegerField(default = 0)
    post_type = models.CharField(max_length = 20, default = 'post')
    post_mime_type = models.CharField(max_length = 100)
    comment_count = models.IntegerField(default = 0)
    class Meta:
        ordering = ['post_date']

class Postmeta(models.Model):
    meta_id = models.IntegerField(primary_key = True)
    post_id = models.IntegerField(default = 0)
    meta_key = models.CharField(max_length = 255)
    meta_value = models.TextField()

class Users(models.Model):
    ID = models.IntegerField(primary_key = True)
    user_login = models.CharField(max_length = 60)
    user_pass = models.CharField(max_length = 64)
    user_nicename = models.CharField(max_length = 50)
    user_email = models.CharField(max_length = 100)
    user_url = models.CharField(max_length = 100)
    user_registered = models.DateTimeField(default = datetime.datetime(2014, 1, 1))
    user_activation_key = models.CharField(max_length = 60)
    user_status = models.IntegerField(default = 0)
    display_name = models.CharField(max_length = 250)
