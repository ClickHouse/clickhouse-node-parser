SELECT 1
FROM
    (
        SELECT 1 AS a
    ) AS A
INNER JOIN (
        SELECT 1 AS b
    ) AS B
    ON equals(a); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH, 62 }

SELECT 1
FROM
    (
        SELECT 1 AS a
    ) AS A
INNER JOIN (
        SELECT 1 AS b
    ) AS B
    ON less(a); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH, 62 }

SET join_algorithm = 'partial_merge';

SELECT 1
FROM
    (
        SELECT 1 AS a
    ) AS A
INNER JOIN (
        SELECT
            1 AS b,
            1 AS c
    ) AS B
    ON a = b
    OR a = c; -- { serverError NOT_IMPLEMENTED }

-- works for a = b OR a = b because of equivalent disjunct optimization
SET join_algorithm = 'grace_hash';