SELECT *
FROM (
        SELECT
            common.key,
            common.value,
            trees.name,
            trees.name2
        FROM
            (
                SELECT *
                FROM tableCommon
            ) AS common
        INNER JOIN (
                SELECT *
                FROM tableTrees
            ) AS trees
            ON (common.key = trees.key)
    )
UNION ALL
(SELECT
    common.key,
    common.value,
    NULL AS name,
    NULL AS name2
FROM
    (
        SELECT *
        FROM tableCommon
    ) AS common
INNER JOIN (
        SELECT *
        FROM tableFlowers
    ) AS flowers
    ON (common.key = flowers.key));

SELECT *
FROM (
        SELECT
            common.key,
            common.value,
            trees.name,
            trees.name2
        FROM
            (
                SELECT *
                FROM tableCommon
            ) AS common
        INNER JOIN (
                SELECT *
                FROM tableTrees
            ) AS trees
            ON (common.key = trees.key)
    )
UNION ALL
(SELECT
    common.key,
    common.value,
    flowers.name,
    NULL AS name2
FROM
    (
        SELECT *
        FROM tableCommon
    ) AS common
INNER JOIN (
        SELECT *
        FROM tableFlowers
    ) AS flowers
    ON (common.key = flowers.key));