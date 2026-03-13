SELECT *
FROM
    dist_02175 AS l
INNER JOIN local_02175 AS r
    USING (dummy);

SELECT *
FROM
    dist_02175 AS l
INNER JOIN local_02175 AS r
    USING (dummy);

-- explicit database for distributed table
SELECT *
FROM
    remote('127.1', currentDatabase(), dist_02175) AS l
INNER JOIN local_02175 AS r
    USING (dummy);

SELECT *
FROM
    remote('127.1', currentDatabase(), dist_02175) AS l
INNER JOIN local_02175 AS r
    USING (dummy);