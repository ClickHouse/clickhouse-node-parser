CREATE TABLE table2 AS numbers(5);

CREATE TABLE table3 AS table2;

SELECT
    count(),
    sum(number)
FROM table2;

SELECT
    count(),
    sum(number)
FROM table3;