# -*- coding: utf-8 -*-
"""
Created on Tue Nov 14 15:04:10 2023

@author: Brine
"""

import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="user1",
  password="password1",
  database="videogames"
)

mycursor = mydb.cursor()
sql = "INSERT INTO videogames (id, Type, Title, System, Cost) VALUES (%s, %s)"
val = [
  ('13', 'Open World', 'Animal Crossing', 'Game Cube', '90.00'),
  ('97', 'Puzzle Adventure', 'Layton\'s Mystery Journey: Katrielle and the Millionaires\' Conspiracy', 'Switch', '48.99'),
]

mycursor.execute(sql, val)

mydb.commit()


import socket
svrSkt = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  
# svrSkt is short for serverSocket
svrSkt.bind(('127.0.0.1:80'))  #bind the socket to port 80 
svrSkt.listen(1)  # set the socket to listen

connectionSocket, address = svrSkt.accept()

connectionSocket.send(bytes("Welcome to the server!"))

while True:
	sentence = connectionSocket.recv(1024)
	if len(sentence) <= 0:
		break
	print(sentence)
	capitalizedSentence = sentence.upper()
	connectionSocket.send(capitalizedSentence)
	print(capitalizedSentence)
    cursor.execute (("SELECT * FROM videogames WHERE title = %(anything)s", 
                    {'anything': notgoingin})
                    AF_INETrows = cursor.fetchall())
    for row in rows:
	print("row")
	for field in row:
		print("field : %s " % field)



INSERT INTO videogames (id, Type, Title, System, Cost) VALUES (24,'First Person Shooter','Doom', 'PC', 2.00);
INSERT INTO videogames (id, Type, Title, System, Cost) VALUES (42,'RPG', 'Final Fantasy 3', 'Play Station X', 85.99);
INSERT INTO videogames (id, Type, Title, System, Cost) VALUES (64,'RPG', 'Resident Evil', 'Play Station', 200.00);

mycursor.executemany(sql, val)

mydb.commit()


db.close()
connectionSocket.close()
