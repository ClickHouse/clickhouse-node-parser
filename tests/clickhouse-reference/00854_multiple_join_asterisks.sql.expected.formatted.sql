SELECT
    t1.dummy,
    t2.dummy,
    t3.dummy
FROM
    `system`.one AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
INNER JOIN `system`.one AS t3
    ON t1.dummy = t3.dummy;

SELECT *
FROM
    `system`.one AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
INNER JOIN `system`.one AS t3
    ON t1.dummy = t3.dummy;

SELECT t1.*
FROM
    `system`.one AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
INNER JOIN `system`.one AS t3
    ON t1.dummy = t3.dummy;

SELECT
    t2.*,
    t3.*
FROM
    `system`.one AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
INNER JOIN `system`.one AS t3
    ON t1.dummy = t3.dummy;

SELECT
    t1.dummy,
    t2.*,
    t3.dummy
FROM
    `system`.one AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
INNER JOIN `system`.one AS t3
    ON t1.dummy = t3.dummy;

SELECT
    t1.dummy,
    t2.*,
    t3.dummy
FROM
    `system`.one AS t1
INNER JOIN (
        SELECT
            dummy,
            0 AS another_one
        FROM `system`.one
    ) AS t2
    ON t1.dummy = t2.dummy
    OR t1.dummy = t2.another_one
INNER JOIN `system`.one AS t3
    ON t1.dummy = t3.dummy;

SELECT
    t1.dummy,
    t2.*,
    t3.dummy
FROM
    (
        SELECT *
        FROM `system`.one
    ) AS t1
INNER JOIN `system`.one AS t2
    ON t1.dummy = t2.dummy
INNER JOIN `system`.one AS t3
    ON t1.dummy = t3.dummy;