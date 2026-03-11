SELECT
    groupArray(a) AS b,
    b[1]
FROM (
        SELECT (1, 2) AS a
    );