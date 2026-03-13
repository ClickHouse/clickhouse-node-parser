-- https://github.com/ClickHouse/ClickHouse/issues/67042
-- Reference generated using percent_rank() and dense_rank()
-- From ClickHouse/tests/queries/0_stateless/01591_window_functions.sql  (for deterministic query)
SELECT '---- denseRank() ----';

SELECT
    number,
    p,
    o,
    count(*),
    rank(),
    denseRank(),
    row_number()
FROM (
        SELECT
            number,
            intDiv(number, 5) AS p,
            mod(number, 3) AS o
        FROM numbers(31)
        ORDER BY
            o ASC,
            number ASC
    ) AS t
ORDER BY
    p ASC,
    o ASC,
    number ASC
WINDOW w AS (partition by p order by o, number)
SETTINGS max_block_size = 2;

SELECT *
FROM (
        SELECT
            product_name,
            group_name,
            price,
            rank() OVER (PARTITION BY group_name ORDER BY price ASC) AS rank,
            percentRank() OVER (PARTITION BY group_name ORDER BY price ASC) AS percent
        FROM
            products
        INNER JOIN product_groups
            USING (group_id)
    ) AS t
ORDER BY
    group_name ASC,
    price ASC,
    product_name ASC;