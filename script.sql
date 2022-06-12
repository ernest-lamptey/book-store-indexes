SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_Indexes
WHERE tablename = 'customers'
OR tablename = 'books'
OR tablename = 'orders';

CREATE INDEX orders_customer_id_idx ON orders(customer_id);
CREATE INDEX orders_book_id_idx ON orders(book_id);

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty(pg_total_relation_size('books'));

CREATE INDEX books_language_title_sales_idx ON books(original_language, title, sales_in_millions);

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty(pg_total_relation_size('books'));

DROP INDEX IF EXISTS books_language_title_sales_idx;

SELECT NOW();

\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;

SELECT NOW();

EXPLAIN ANALYZE SELECT first_name, last_name, email_address
FROM customers
WHERE first_name = 'Sandra'
AND last_name = 'Flores';

CREATE INDEX customers_first_name_last_name_email_address_idx ON customer(first_name, last_name, email_address);

EXPLAIN ANALYZE SELECT first_name, last_name, email_address
FROM customers
WHERE first_name = 'Sandra'
AND last_name = 'Flores';



