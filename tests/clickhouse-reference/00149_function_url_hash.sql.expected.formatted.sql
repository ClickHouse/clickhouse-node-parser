SELECT URLHash('' AS url) = URLHash(appendTrailingCharIfAbsent(url, '/'));

SELECT URLHash('http://ya.ru' AS url) = URLHash(appendTrailingCharIfAbsent(url, '/'));

SELECT URLHash('http://ya.ru' AS url) = URLHash(appendTrailingCharIfAbsent(url, '?'));

SELECT URLHash('http://ya.ru' AS url) = URLHash(appendTrailingCharIfAbsent(url, '#'));

SELECT URLHash('' AS url, 0) = URLHash(url);

SELECT URLHash('' AS url, 1) = URLHash(url);

SELECT URLHash('' AS url, 1000) = URLHash(url);

SELECT URLHash('http://ya.ru/a' AS url, 0 AS level) = URLHash(URLHierarchy(url)[level + 1]);

SELECT URLHash('http://ya.ru/a' AS url, 1 AS level) = URLHash(URLHierarchy(url)[level + 1]);

SELECT URLHash(url, 0 AS level) = URLHash(URLHierarchy(url)[level + 1])
FROM
    `system`.one
ARRAY JOIN ['', 'http://ya.ru', 'http://ya.ru/', 'http://ya.ru/a', 'http://ya.ru/a/', 'http://ya.ru/a/b', 'http://ya.ru/a/b?'] AS url;

SELECT URLHash(url, 1 AS level) = URLHash(URLHierarchy(url)[level + 1])
FROM
    `system`.one
ARRAY JOIN ['', 'http://ya.ru', 'http://ya.ru/', 'http://ya.ru/a', 'http://ya.ru/a/', 'http://ya.ru/a/b', 'http://ya.ru/a/b?'] AS url;

SELECT URLHash(url, 2 AS level) = URLHash(URLHierarchy(url)[level + 1])
FROM
    `system`.one
ARRAY JOIN ['', 'http://ya.ru', 'http://ya.ru/', 'http://ya.ru/a', 'http://ya.ru/a/', 'http://ya.ru/a/b', 'http://ya.ru/a/b?'] AS url;

SELECT URLHash(url, 3 AS level) = URLHash(URLHierarchy(url)[level + 1])
FROM
    `system`.one
ARRAY JOIN ['', 'http://ya.ru', 'http://ya.ru/', 'http://ya.ru/a', 'http://ya.ru/a/', 'http://ya.ru/a/b', 'http://ya.ru/a/b?'] AS url;

SELECT URLHash(url, 4 AS level) = URLHash(URLHierarchy(url)[level + 1])
FROM
    `system`.one
ARRAY JOIN ['', 'http://ya.ru', 'http://ya.ru/', 'http://ya.ru/a', 'http://ya.ru/a/', 'http://ya.ru/a/b', 'http://ya.ru/a/b?'] AS url;