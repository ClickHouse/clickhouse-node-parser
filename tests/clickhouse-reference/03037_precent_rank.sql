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
        percent_rank() OVER (PARTITION BY group_name ORDER BY price ASC) AS percent
    FROM products
    INNER JOIN product_groups USING (group_id)
) AS t
ORDER BY
    group_name ASC,
    price ASC,
    product_name ASC;
select number, row_number, cast(percent_rank * 10000 as Int32) as percent_rank
from (
	select number, row_number() over () as row_number, percent_rank() over (order by number) as percent_rank
	from numbers(10000)
	order by number
	limit 10
)
settings max_block_size=100;
