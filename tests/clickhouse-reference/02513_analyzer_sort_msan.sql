SELECT rank() OVER (ORDER BY price) AS rank FROM products ORDER BY rank;
