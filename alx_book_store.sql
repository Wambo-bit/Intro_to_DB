/*
-- Create database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE alx_book_store;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
*/
import mysql.connector

# Step 1: Connect to MySQL server (no database yet)
mydb = mysql.connector.connect(
    host="localhost",
    user="root",   
    password="Mu,thi.ma@5196!" 
)

mycursor = mydb.cursor()

# Step 2: Create the database
mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
print("Database created successfully!")

# Step 3: Connect to the bookstore database
mydb.database = "alx_book_store"

# Step 4: Create the tables
mycursor.execute
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(215)
)


mycursor.execute
CREATE TABLE IF NOT EXISTS Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130),
  author_id INT,
  price DOUBLE,
  publication_date DATE,
  FOREIGN KEY (author_id) REFERENCES Authors(author_id)
)


mycursor.execute
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215),
  email VARCHAR(215),
  address TEXT
)


mycursor.execute
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)


mycursor.execute
CREATE TABLE IF NOT EXISTS Order_Details (
  orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  book_id INT,
  quantity DOUBLE,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
)


print("All tables created successfully!")

/*# Step 5: Insert some sample data

# Insert authors
sql = "INSERT INTO Authors (author_name) VALUES (%s)"
authors = [("J.K. Rowling",), ("George R.R. Martin",), ("Chinua Achebe",)]
mycursor.executemany(sql, authors)
mydb.commit()
print(mycursor.rowcount, "authors inserted.")

# Insert books
sql = "INSERT INTO Books (title, author_id, price, publication_date) VALUES (%s, %s, %s, %s)"
books = [
    ("Harry Potter and the Sorcerer's Stone", 1, 20.5, "1997-06-26"),
    ("A Game of Thrones", 2, 25.0, "1996-08-06"),
    ("Things Fall Apart", 3, 15.0, "1958-06-17")
]
mycursor.executemany(sql, books)
mydb.commit()
print(mycursor.rowcount, "books inserted.")

# Insert customers
sql = "INSERT INTO Customers (customer_name, email, address) VALUES (%s, %s, %s)"
customers = [
    ("Alice Johnson", "alice@example.com", "123 Main St"),
    ("Bob Smith", "bob@example.com", "456 Elm St")
]
mycursor.executemany(sql, customers)
mydb.commit()
print(mycursor.rowcount, "customers inserted.")

# Step 6: Read data (example: all books)
mycursor.execute("SELECT * FROM Books")
books = mycursor.fetchall()
print("\nBooks in store:")
for book in books:
    print(book)

# Step 7: Update a book price
sql = "UPDATE Books SET price = %s WHERE book_id = %s"
val = (22.0, 1)  # update book_id=1
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "book(s) updated.")

# Step 8: Delete a customer
sql = "DELETE FROM Customers WHERE customer_id = %s"
val = (2,)  # delete Bob Smith
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "customer(s) deleted.")

# Step 9: Close connection
mycursor.close()
mydb.close()
print("\nDatabase connection closed.")
