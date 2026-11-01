Online Bookstore Database Management System
Project overview
This project uses PostgreSQL to create and query a relational database for an online bookstore. It contains three related tables: Books, Customers, and Orders.
Tools
- PostgreSQL
- pgAdmin 4
- SQL
Database structure
- Books: book title, author, genre, publication year, price, and stock.
- Customers: customer name, email, phone, city, and country.
- Orders: customer, book, order date, quantity, and total amount.
Orders.Customer_ID references Customers.Customer_ID, and Orders.Book_ID references Books.Book_ID.
SQL concepts demonstrated
- Database and table creation
- SERIAL primary keys and foreign keys
- Filtering with WHERE and BETWEEN
- Sorting with ORDER BY and limiting results with LIMIT
- Removing duplicate values with DISTINCT
- Aggregate functions: SUM, AVG, and COUNT
- Grouping with GROUP BY and filtering groups with HAVING
- Inner and left joins
- Handling missing values with COALESCE
Questions explored
The queries investigate book genres and publication years, customers by country, orders in a date range, total stock, book prices, order quantities and amounts, revenue, sales by genre and author, repeat customers, popular books, and estimated remaining stock after orders.
How to run
1. Open pgAdmin 4 and connect to your PostgreSQL server.
2. Create the database by running CREATE DATABASE OnlineBookstore; in a maintenance database.
3. Connect to OnlineBookstore.
4. Run the table-creation statements.
5. Load or insert the dataset into the three tables.
6. Run the analysis queries.
Note: The supplied SQL file defines the database and tables and contains analysis queries, but it does not include INSERT statements or a data file. Add your dataset separately before expecting meaningful query results.
Validation notes
A few queries in the original script needed adjustment to match their comments:
- Customer spending must join Orders to Customers using customer_id, and spending should sum total_amount.
- Customers whose overall spending exceeds $30 should be identified by grouping orders per customer, rather than filtering individual orders.
- The author-sales query should not use LIMIT 5 if the intention is to show every author.
- The most expensive book query should use LIMIT 1 if the intention is to return only one book.
These adjustments are included in OnlineBookstore_SQL_Corrected.sql.
Project learning
This project provided practice in designing a relational database and writing SQL queries to answer operational and business questions about books, customers, orders, sales, and inventory.
Next improvements
- Include the dataset or reproducible INSERT statements.
- Add an entity-relationship diagram (ERD).
- Capture screenshots of selected query results.
- Test the inventory calculation against the business meaning of the Stock field. If Stock is current stock, subtracting historical orders again may double-count sales.
