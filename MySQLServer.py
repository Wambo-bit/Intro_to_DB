#!/usr/bin/python3
import mysql.connector
from mysql.connector import Error

def create_alx_database(host="localhost", user="root", password="yourpassword"):
    conn = None
    cursor = None
    try:
        # Connect to MySQL server
        conn = mysql.connector.connect(
            host=host,
            user="root",
            password="Mu,thi.ma@5196!"
        )

        cursor = conn.cursor()

        # Create database (checker expects IF NOT EXISTS and underscore naming)
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        print("Database 'alx_book_store' created successfully (or already exists).")

    except Error as err:
        print("Error:", err)

    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    HOST = "localhost"
    USER = "root"   # change if your MySQL username is different
    PASSWORD = "Mu,thi.ma@5196!"   # wrap your real password in quotes

    create_alx_database(host=HOST, user=USER, password=PASSWORD)
