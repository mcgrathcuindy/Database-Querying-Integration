"""
Name: Christopher McGrath
Date: 4/21/2020
Desc: Project 2 python script to find the min, max, and avg of the total
"""
import pymongo 
from pymongo import MongoClient
import pprint

client = MongoClient('mongodb://localhost:27017/')

listOfEveryDocument = []
listOfStrings = []
listOfAllKeysAndValues = []
listOfTotalValues = []
charactersToDelete = "," 

db = client.project
thing = db.transactions.find({"Payment.Total" : {"$gt" : 0}})

#Loop to copy every Document from the "thing" to a list
for i in thing:
    listOfEveryDocument.append(i)

#Loop to populate a new list with a string of Each Document, I do this so i can use the split function
for i in range(len(listOfEveryDocument)):
    listOfStrings.append(str(listOfEveryDocument[i].values()))

#Loop to split the string of each document into separate strings, and add the separate strings into a new list
for i in range(len(listOfStrings)):
    listOfAllKeysAndValues.append(listOfStrings[i].split())
    
#Loop to iterate over each list in listOfAllKeysAndValues, we find the values for Total and append them into a new list, we don't need the rest of the information
for i in range(len(listOfAllKeysAndValues)):
    for j in range(len(listOfAllKeysAndValues[i])):
        if j == 14 and i == len(listOfAllKeysAndValues) -1:
            listOfTotalValues.append(listOfAllKeysAndValues[i][j])
            break
        if j == 16: 
            listOfTotalValues.append(listOfAllKeysAndValues[i][j])

#Loop to delete the ending characters of each string of values, we need to delete them so we can typecast each value from a string to an int ',' 
for char in charactersToDelete:
    for i in range(0,len(listOfTotalValues)):
        listOfTotalValues[i] = listOfTotalValues[i].replace(char,"")

#Loop to typecast each price value from a string to an int so we can find the avg, min, and max        
for i in range(0,len(listOfTotalValues)):
    listOfTotalValues[i] = int(listOfTotalValues[i])

#declaring the variables needed to find the avg, min, and max of prices
avg = 0
sum = 0
max = listOfTotalValues[0]
min = listOfTotalValues[0]

#loop that finds the avg, min, and max
for i in range(len(listOfTotalValues)):
    if listOfTotalValues[i] > max:
        max = listOfTotalValues[i]
    if listOfTotalValues[i] < min:
        min = listOfTotalValues[i]
    sum = sum + listOfTotalValues[i]
avg = sum / len(listOfTotalValues)

print("The avg of all prices is: {}".format(avg))
print("The min of all prices is: {}".format(min))
print("The max of all prices is: {}".format(max))