import mysql.connector

db = mysql.connector.connect(host="localhost",
                     user="root",
                     passwd="0969")

try:
    cursor = db.cursor()
    cursor.execute("CREATE Database if not exists Customers")
    cursor.execute("""
        CREATE TABLE Customers.customer (
        id INT NOT NULL AUTO_INCREMENT,
        name TEXT NOT NULL,
        PRIMARY KEY (id)
    )""")
    result = cursor.fetchall()
    print (result)
finally:
    db.close()
