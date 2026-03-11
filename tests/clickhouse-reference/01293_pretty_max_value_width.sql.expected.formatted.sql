SELECT
    'привет' AS x,
    'мир' AS y
FORMAT Pretty;

SELECT
    'привет' AS x,
    'мир' AS y
FORMAT PrettyCompact;

SELECT
    'привет' AS x,
    'мир' AS y
FORMAT PrettySpace;

SELECT *
FROM VALUES('x String, y String', ('привет', 'мир'), ('мир', 'привет'))
FORMAT Pretty;

SELECT *
FROM VALUES('x String, y String', ('привет', 'мир'), ('мир', 'привет'))
FORMAT PrettyCompact;

SELECT *
FROM VALUES('x String, y String', ('привет', 'мир'), ('мир', 'привет'))
FORMAT PrettySpace;