Online Bookstore Database Management System


Project overview:

This project uses PostgreSQL to create and query a relational database for an online bookstore. It contains three related tables: Books, Customers, and Orders.
Tools:
- PostgreSQL
- pgAdmin 4
- SQL

Database structure:
- Books: book title, author, genre, publication year, price, and stock.
- Customers: customer name, email, phone, city, and country.
- Orders: customer, book, order date, quantity, and total amount.
Orders.Customer_ID references Customers.Customer_ID, and Orders.Book_ID references Books.Book_ID.

SQL concepts demonstrated:
- Database and table creation
- SERIAL primary keys and foreign keys
- Filtering with WHERE and BETWEEN
- Sorting with ORDER BY and limiting results with LIMIT
- Removing duplicate values with DISTINCT
- Aggregate functions: SUM, AVG, and COUNT
- Grouping with GROUP BY and filtering groups with HAVING
- Inner and left joins
- Handling missing values with COALESCE

Questions explored:
The queries investigate book genres and publication years, customers by country, orders in a date range, total stock, book prices, order quantities and amounts, revenue, sales by genre and author, repeat customers, popular books, and estimated remaining stock after orders.

Project learning:

This project provided practice in designing a relational database and writing SQL queries to answer operational and business questions about books, customers, orders, sales, and inventory.

📸 Project Screenshots

1. Database Schema and SQL Editor

This screenshot demonstrates the database creation process, table structures, primary keys, and SQL implementation.

![Database Schema](assets/screenshots/01-database-schema-and-sql-editor.png)

2. Advanced SQL Queries

This screenshot demonstrates advanced SQL operations, including JOIN, GROUP BY, aggregate functions, and HAVING clauses.

![Advanced SQL Queries](assets/screenshots/02-advanced-sql-queries.png)



