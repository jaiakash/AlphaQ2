#!usr/bin/python3

import mysql.connector
import sys

mydb = mysql.connector.connect(
  host="8888",
  user="root",
  password="toor"
)

mycursor = mydb.cursor()

# Creating Database with name Database_MOM
mycursor.execute("CREATE DATABASE Database_MOM")
mycursor.execute("USE Database_MOM")

# Creating table with name MOM
mycursor.execute("CREATE TABLE MOM (date VARCHAR(255), user VARCHAR(255))")
sql = "INSERT INTO MOM (date, user) VALUES (%s, %s)"

# Adding dates and user name to database
val = (sys.argv[1], sys.argv[2])
mycursor.execute(sql, val)
mydb.commit()