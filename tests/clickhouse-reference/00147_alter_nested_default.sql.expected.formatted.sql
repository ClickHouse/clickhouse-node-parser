SELECT *
FROM alter_00147;

SELECT *
FROM
    alter_00147
ARRAY JOIN n;

SELECT *
FROM
    alter_00147
ARRAY JOIN n
WHERE like(n.x, '%Hello%');

SELECT *
FROM alter_00147
ORDER BY n.x ASC;

SELECT *
FROM
    alter_00147
ARRAY JOIN n
ORDER BY n.x ASC;

SELECT *
FROM
    alter_00147
ARRAY JOIN n
WHERE like(n.x, '%Hello%')
ORDER BY n.x ASC;