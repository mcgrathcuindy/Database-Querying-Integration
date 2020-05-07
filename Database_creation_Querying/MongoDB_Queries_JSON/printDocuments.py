"""
Name: Christopher McGrath
Date: 4/21/2020
Desc: Project 2 python script to print all documents
"""
import pymongo 
from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')

db = client.project
thing = db.transactions.find()
print(list(thing))