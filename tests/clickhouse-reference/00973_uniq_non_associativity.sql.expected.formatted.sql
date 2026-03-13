/** Results of these two queries must match: */
SELECT uniq(number)
FROM (
        SELECT *
        FROM part_a
        UNION ALL
        SELECT *
        FROM part_c
        UNION ALL
        SELECT *
        FROM part_d
        UNION ALL
        SELECT *
        FROM part_b
    );

SELECT uniq(number)
FROM (
        SELECT *
        FROM part_a
        UNION ALL
        SELECT *
        FROM part_c
        UNION ALL
        SELECT *
        FROM part_d
        UNION ALL
        SELECT *
        FROM part_b
        UNION ALL
        SELECT *
        FROM part_d
    );