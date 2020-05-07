"""
Name: Christopher McGrath
Date: 4/21/2020
Desc: Project 2 python script to print the names in a sorted way
"""
import pymongo 
from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')

db = client.project
thing = db.transactions.find()
alist = []

for i in thing:
    alist.append(i["Name"])
    
alist.sort()
print(list(alist))