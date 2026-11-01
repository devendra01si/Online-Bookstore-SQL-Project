-- Create Database
CREATE DATABASE OnlineBookstore;

-- Create Tables
-- Drop child table first because it references Books and Customers
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" genre:
select * from Books
where genre= 'Fiction';

-- 2) Find books published after the year 1950:
select * from Books
where published_year>1950;

-- 3) List all customers from the Canada:
select * from Customers
where country='Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) as total_stock
from Books;

-- 6) Find the details of the most expensive book:
-- Return the single most expensive book
SELECT *
FROM Books
ORDER BY Price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from Orders
where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from Orders
where total_amount>20;

-- 9) List all genres available in the Books table:
select distinct genre from Books;

-- 10) Find the book with the lowest stock:
select * from Books order by stock  limit 3;

-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount) as total_revenue
from Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT * FROM ORDERS;

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
select avg(price) as average_price
from Books
where genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:
SELECT o.customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(Order_id) >=2;

-- 4) Find the most frequently ordered book:
select *from Books;
select * from Orders;
select o.book_id, b.title, count(o.order_id) as order_count
from orders o
join books b on o.book_id=b.book_id
group by o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from Books 
where genre='Fantasy' 
order by price desc limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
-- Total quantity of books sold by each author (all authors)
SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.book_id = b.book_id
GROUP BY b.author
ORDER BY Total_Books_Sold DESC;

-- 7) List the cities where customers who spent over $30 are located:
-- Cities of customers whose cumulative order spending exceeds $30
SELECT c.city, c.customer_id, c.name,
       SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city, c.customer_id, c.name
HAVING SUM(o.total_amount) > 30
ORDER BY total_spent DESC;

-- 8) Find the customer who spent the most on orders:
-- Top 5 customers by total money spent
SELECT c.customer_id, c.name,
       SUM(o.total_amount) AS customer_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY customer_spent DESC
LIMIT 5;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id,b.title,b.stock,coalesce(sum(o.quantity),0) as order_quantity,
       b.stock - coalesce(sum(o.quantity),0) as remaining_quantity
FROM Books b
left join orders o on b.book_id=o.book_id
group by b.book_iD ORDER BY b.book_id;