SELECT rank() OVER (ORDER BY price ASC) AS rank
FROM products
ORDER BY rank ASC;