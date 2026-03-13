SELECT *
FROM `system`.numbers
ORDER BY number ASC; -- { serverError TOO_MANY_ROWS_OR_BYTES }

SELECT count() >= 100
    AND count() <= 1000
FROM (
        SELECT *
        FROM `system`.numbers
        ORDER BY number ASC
    );