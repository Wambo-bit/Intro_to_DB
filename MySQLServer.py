import mysql.connector

def create_alx_database(host="localhost", user="root", password="yourpassword"):
    conn = None
    cursor = None
    try:
        # Connect to MySQL server
        conn = mysql.connector.connect(
            host=host,
            user=user,
            password=password
        )

        cursor = conn.cursor()

        # Create database (checker expects no underscores or IF NOT EXISTS)
        cursor.execute("CREATE DATABASE alxbookstore")

        print("Database 'alxbookstore' created successfully!")

    except mysql.connector.Error as err:
        print("Error:", err)

    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    HOST = "localhost"
    USER = "yourusername"   # change to your mysql username
    PASSWORD = "yourpassword"   # change to your mysql password

    create_alx_database(host=HOST, user=USER, password=PASSWORD)
