SELECT item_id
FROM
    (
        SELECT item_id
        FROM t
        GROUP BY item_id
        WITH TOTALS
    ) AS l
FULL JOIN (
        SELECT item_id
        FROM t
        GROUP BY item_id
        WITH TOTALS
    ) AS r
    USING (item_id);

SELECT item_id
FROM
    (
        SELECT item_id
        FROM t
        GROUP BY item_id
        WITH TOTALS
    ) AS l
FULL JOIN (
        SELECT item_id
        FROM t
        GROUP BY item_id
        WITH TOTALS
    ) AS r
    USING (item_id)
SETTINGS join_use_nulls = '1';

SELECT *
FROM
    (
        SELECT
            item_id,
            sum(price_sold) AS price_sold
        FROM t
        GROUP BY item_id
        WITH TOTALS
    ) AS l
FULL JOIN (
        SELECT
            item_id,
            sum(price_sold) AS price_sold
        FROM t
        GROUP BY item_id
        WITH TOTALS
    ) AS r
    USING (item_id)
SETTINGS join_use_nulls = '1';