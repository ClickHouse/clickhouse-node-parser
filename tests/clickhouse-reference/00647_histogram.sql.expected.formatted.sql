SELECT histogram(5)(number - 10)
FROM (
        SELECT *
        FROM `system`.numbers
        LIMIT 20
    );

SELECT histogram(5)(number)
FROM (
        SELECT *
        FROM `system`.numbers
        LIMIT 20
    );

SELECT histogram(10)(-2);

SELECT histogramIf(3)(number, number > 11)
FROM (
        SELECT *
        FROM `system`.numbers
        LIMIT 10
    );