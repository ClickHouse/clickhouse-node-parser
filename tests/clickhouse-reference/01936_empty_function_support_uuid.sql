SELECT empty(toUUID('00000000-0000-0000-0000-000000000000'));
SELECT notEmpty(toUUID('00000000-0000-0000-0000-000000000000'));
SELECT uniqIf(uuid, empty(uuid)), uniqIf(uuid, notEmpty(uuid))
FROM
(
    SELECT toUUID('00000000-0000-0000-0000-000000000002') AS uuid
    UNION ALL
    SELECT toUUID('00000000-0000-0000-0000-000000000000') AS uuid
    UNION ALL
    SELECT toUUID('00000000-0000-0000-0000-000000000001') AS uuid
);
SELECT
    uniq(user_id) AS users,
    uniqIf(order_id, notEmpty(order_id)) AS orders
FROM
(
    SELECT * FROM users
) t1 ALL LEFT JOIN (
    SELECT * FROM orders
) t2 USING (user_id);
