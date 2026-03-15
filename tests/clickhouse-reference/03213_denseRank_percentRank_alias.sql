-- https://github.com/ClickHouse/ClickHouse/issues/67042
-- Reference generated using percent_rank() and dense_rank()

-- From ClickHouse/tests/queries/0_stateless/01591_window_functions.sql  (for deterministic query)
SELECT '---- denseRank() ----';
select number, p, o,
    count(*) over w,
    rank() over w,
    denseRank() over w,
    row_number() over w
from (select number, intDiv(number, 5) p, mod(number, 3) o
    from numbers(31) order by o, number) t
window w as (partition by p order by o, number)
order by p, o, number
settings max_block_size = 2;
CREATE TABLE product_groups (
	group_id Int64,
	group_name String
) Engine = Memory;
CREATE TABLE products (
	product_id Int64,
	product_name String,
	price DECIMAL(11, 2),
	group_id Int64
) Engine = Memory;
SELECT *
FROM
(
    SELECT
        product_name,
        group_name,
        price,
        rank() OVER (PARTITION BY group_name ORDER BY price ASC) AS rank,
        percentRank() OVER (PARTITION BY group_name ORDER BY price ASC) AS percent
    FROM products
    INNER JOIN product_groups USING (group_id)
) AS t
ORDER BY
    group_name ASC,
    price ASC,
    product_name ASC;
