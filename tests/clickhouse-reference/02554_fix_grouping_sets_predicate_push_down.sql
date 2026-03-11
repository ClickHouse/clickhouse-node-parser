SELECT '---Explain Syntax---';
SELECT *
FROM
(
    SELECT
        day_,
        if(type_1 = '', 'all', type_1) AS type_1
    FROM
    (
        SELECT
            day_,
            type_1
        FROM test_grouping_sets_predicate
        WHERE day_ = '2023-01-05'
        GROUP BY
            GROUPING SETS (
                (day_, type_1),
                (day_))
    ) AS t
)
WHERE type_1 = 'all';
