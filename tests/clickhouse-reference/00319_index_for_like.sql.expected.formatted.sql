SELECT s
FROM index_for_like
WHERE like(s, 'Hello, World%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, World %');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, World 1%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, World 2%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, Worle%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, Wor%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello %');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello,%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello;%');

SELECT s
FROM index_for_like
WHERE like(s, 'H%');

SELECT s
FROM index_for_like
WHERE like(s, 'Good%');

SELECT s
FROM index_for_like
WHERE like(s, '%');

SELECT s
FROM index_for_like
WHERE like(s, '%Hello%');

SELECT s
FROM index_for_like
WHERE like(s, '%Hello');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, World% %');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, Worl_%');

SELECT s
FROM index_for_like
WHERE like(s, 'Hello, Worl\\_%');