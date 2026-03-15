CREATE TABLE b_customers
(
    customer_id Int64,
    first_order_id Int64
)
ENGINE = MergeTree
ORDER BY customer_id;

CREATE TABLE b_orders
(
    order_id Int64,
    address_id String
)
ENGINE = MergeTree
ORDER BY order_id;

CREATE TABLE b_addresses
(
    address_id String
)
ENGINE = MergeTree
ORDER BY address_id;

SET query_plan_join_swap_table = 0;

SELECT count()
FROM (
        SELECT customers.customer_id AS dim_customers_id
        FROM
            b_orders AS orders
        RIGHT JOIN b_customers AS customers
            ON orders.order_id = customers.first_order_id
        LEFT JOIN b_addresses AS shipping_addresses
            ON shipping_addresses.address_id = orders.address_id
    );