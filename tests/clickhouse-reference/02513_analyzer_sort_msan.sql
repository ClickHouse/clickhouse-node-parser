SET enable_analyzer = 1;
CREATE TABLE products (`price` UInt32) ENGINE = Memory;
SELECT rank() OVER (ORDER BY price) AS rank FROM products ORDER BY rank;
