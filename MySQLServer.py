import mysql.connector
from mysql.connector import Error

def create_alx_database(host="localhost", user="root", password="Mu,thi.ma@5196!"):
    conn = None
    cursor = None
    try:
        # Connect to MySQL server (do NOT specify database here)
        conn = mysql.connector.connect(
            host=host,
            user="root",
            password="Mu,thi.ma@5196!"
        )

        cursor = conn.cursor()

        # Create database (IF NOT EXISTS ensures it won't fail if already present)
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

        # Required success message
        print("Database 'alx_book_store' created successfully!")

    except Error as err:
        # Print error message if connection or execution fails
        print("Error:", err)

    finally:
        # Cleanly close cursor and connection if opened
        if cursor:
            try:
                cursor.close()
            except Exception:
                pass
        if conn:
            try:
                conn.close()
            except Exception:
                pass

if __name__ == "__main__":
    # --- CHANGE these to your MySQL credentials before running ---
    HOST = "localhost"
    USER = "yourusername"
    PASSWORD = "yourpassword"
    # ------------------------------------------------------------

    create_alx_database(host=HOST, user=USER, password=PASSWORD)
