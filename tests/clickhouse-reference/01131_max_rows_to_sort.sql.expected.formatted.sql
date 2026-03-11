SELECT *
FROM `system`.numbers
ORDER BY number ASC;

SELECT count() >= 100
    AND count() <= 1000
FROM (
        SELECT *
        FROM `system`.numbers
        ORDER BY number ASC
    );