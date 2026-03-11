select count() from
(
  SELECT customers.customer_id AS dim_customers_id
  FROM
      b_orders AS orders
    ANY RIGHT JOIN
      b_customers AS customers
    ON orders.order_id = customers.first_order_id
    ANY LEFT JOIN
      b_addresses AS shipping_addresses
    ON shipping_addresses.address_id = orders.address_id
);
