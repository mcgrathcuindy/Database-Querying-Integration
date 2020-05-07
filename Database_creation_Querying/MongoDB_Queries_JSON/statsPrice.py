"""
Name: Christopher McGrath
Date: 4/21/2020
Desc: Project 2 python script to find the min, max, and avg of the prices
"""
import pymongo 
from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')

listOfEveryTransaction = []
listOfStrings = []
listOfAllKeysAndValues = []
listOfPriceValues = []
charactersToDelete = "])" 

db = client.project
thing = db.transactions.find()

#Loop to copy every Transaction from the "thing" cursor to a list
for i in thing:
    listOfEveryTransaction.append(i["Transaction"]) 

#Loop to populate a new list with a string of Each transaction, I do this so i can use the split function
for i in range(6):
    for j in range(2):
        listOfStrings.append(str(listOfEveryTransaction[i][j].values()))

#Loop to split the string of each transaction into separate strings, and add the separate strings into a new list
for i in range(len(listOfStrings)):
    listOfAllKeysAndValues.append(listOfStrings[i].split())

#Loop to form a new list with the desired values of 'price'
for i in range(len(listOfAllKeysAndValues)):
    for j in range(2):
        #this if condition is used to filter out the Id key and values that we don't need, We just want price values
        if j == 1:
            listOfPriceValues.append(listOfAllKeysAndValues[i][j])

#Loop to delete the ending characters of each string of values ']' ')' 
for char in charactersToDelete:
    for i in range(0,len(listOfPriceValues)):
        listOfPriceValues[i] = listOfPriceValues[i].replace(char,"")

#Loop to typecast each price value from a string to an int so we can find the avg, min, and max        
for i in range(0,len(listOfPriceValues)):
    listOfPriceValues[i] = int(listOfPriceValues[i])

#declaring the variables needed to find the avg, min, and max of prices
avg = 0
sum = 0
max = listOfPriceValues[0]
min = listOfPriceValues[0]

#loop that finds the avg, min, and max
for i in range(len(listOfPriceValues)):
    if listOfPriceValues[i] > max:
        max = listOfPriceValues[i]
    if listOfPriceValues[i] < min:
        min = listOfPriceValues[i]
    sum = sum + listOfPriceValues[i]
avg = sum / len(listOfPriceValues)

print("The avg of all prices is: {}".format(avg))
print("The min of all prices is: {}".format(min))
print("The max of all prices is: {}".format(max))