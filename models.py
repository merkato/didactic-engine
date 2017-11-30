#!/usr/bin/python
# -*- coding: utf-8 -*-
from peewee import *
from playhouse.postgres_ext import *

db = PostgresqlExtDatabase('psp', user='osm', password='osm')

class BaseExtModel(Model):
    class Meta:
        database = db
        db_schema = 'prewencja'

class funkcjonariusze(BaseExtModel):

    user_id = PrimaryKeyField()
    legitymacja = CharField(10)
    stopien = CharField(20)
    tytul = CharField(45)
    nazwisko  = CharField(45)
    stanowisko = CharField(45)

#class protokol(BaseExtModel):
