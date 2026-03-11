SELECT COUNT(1) == 100
FROM `03720_test`;

SELECT COUNT(1) == 5
FROM `03720_test`
WHERE k1 = 5
    AND k2 IN (15, 35, 55, 75, 95);

SELECT COUNT(1) == 0
FROM `03720_test`
WHERE k1 = 6
    AND k2 IN (15, 35, 55, 75, 95);

SELECT COUNT(1) == 1
FROM `03720_test`
WHERE k1 IN (1, 3, 5)
    AND k2 = 15
    AND k1 IN (3, 5, 7);

SELECT COUNT(1) == 0
FROM `03720_test`
WHERE k1 IN (1, 3, 5)
    AND k2 = 15
    AND k1 IN (2, 4, 6);

SELECT COUNT(1) == 6
FROM `03720_test`
WHERE ((k1 IN (1, 3, 5)
    OR k1 IN (2, 3, 4, 5, 6)))
    AND k2 IN (11, 13, 15, 12, 14, 16);

SELECT val
FROM `03720_tuple_equality`
WHERE (k1, k2) = (1, 10)
ORDER BY val ASC;

SELECT val
FROM `03720_tuple_equality`
WHERE (k1, k2) = (2, 20)
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_tuple_equality`
WHERE (k1, k2) = (3, 30);

SELECT COUNT(*)
FROM `03720_tuple_equality`
WHERE k1 = 1
    AND k2 IN (tuple());

SELECT val
FROM `03720_tuple_in`
WHERE (k1, k2) IN ((1, 10), (2, 20), (3, 30))
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_tuple_in`
WHERE (k1, k2) IN ((1, 10), (5, 50));

SELECT val
FROM `03720_three_columns`
WHERE (k1, k2, k3) = (1, 1, 1)
ORDER BY val ASC;

SELECT val
FROM `03720_three_columns`
WHERE (k1, k2, k3) IN ((1, 1, 1), (2, 1, 1))
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_three_columns`
WHERE k1 = 1
    AND k2 = 1
    AND k3 IN (1, 2);

SELECT COUNT(*)
FROM `03720_three_columns`
WHERE (k1 = 1
    AND k2 = 1
    AND k3 = 1)
    OR (k1 = 1
    AND k2 = 2
    AND k3 = 1);

SELECT val
FROM `03720_four_columns`
WHERE (k1, k2, k3, k4) = (1, 2, 3, 4);

SELECT COUNT(*)
FROM `03720_four_columns`
WHERE k1 = 1
    AND k2 = 2
    AND k3 = 3
    AND k4 IN (4, 5);

SELECT val
FROM `03720_string_keys`
WHERE (k1, k2) = ('foo', 'bar')
ORDER BY val ASC;

SELECT val
FROM `03720_string_keys`
WHERE k1 = 'foo'
    AND k2 IN ('bar', 'baz')
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_string_keys`
WHERE (k1, k2) IN (('foo', 'bar'), ('qux', 'bar'));

SELECT val
FROM `03720_mixed_types`
WHERE (k1, k2) = (100, 'a')
ORDER BY val ASC;

SELECT val
FROM `03720_mixed_types`
WHERE k1 = 100
    AND k2 IN ('a', 'b')
ORDER BY val ASC;

SELECT val
FROM `03720_datetime`
WHERE (k1, k2) = (1, '2024-01-01 00:00:00');

SELECT val
FROM `03720_enum`
WHERE (k1, k2) = ('a', 1);

SELECT val
FROM `03720_single_column`
WHERE k1 = 1
ORDER BY val ASC;

SELECT val
FROM `03720_single_column`
WHERE k1 IN (1, 3)
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_cartesian`
WHERE k1 IN (0, 1, 2, 3, 4)
    AND k2 IN (0, 1, 2);

SELECT COUNT(*)
FROM `03720_cartesian`
WHERE k1 = 5
    AND k2 IN (0, 1, 2, 3, 4);

SELECT COUNT(*)
FROM `03720_large_cartesian`
WHERE k1 IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
    AND k2 IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

SELECT COUNT(*)
FROM `03720_empty_results`
WHERE (k1, k2) = (2, 2);

SELECT COUNT(*)
FROM `03720_empty_results`
WHERE (k1, k2) IN ((2, 2), (3, 3));

SELECT COUNT(*)
FROM `03720_empty_results`
WHERE k1 = 1
    AND k2 = 2;

SELECT COUNT(*)
FROM `03720_complex_or`
WHERE (k1 = 1
    AND k2 = 1)
    OR (k1 = 2
    AND k2 = 2);

SELECT COUNT(*)
FROM `03720_complex_or`
WHERE (k1, k2) IN ((1, 1), (2, 2));

SELECT val
FROM `03720_mutations`
WHERE (k1, k2) = (1, 1)
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_partial_key`
WHERE k1 = 1;

SELECT COUNT(*)
FROM `03720_deletes`;

SELECT val
FROM `03720_deletes`
WHERE k1 = 1
ORDER BY val ASC;

SELECT val
FROM `03720_deletes`
WHERE k1 = 2
ORDER BY val ASC;

SELECT val
FROM `03720_deletes`
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_deletes_three_col`;

SELECT val
FROM `03720_deletes_three_col`
ORDER BY val ASC;

SELECT COUNT(*)
FROM `03720_deletes_string`;

SELECT val
FROM `03720_deletes_string`
WHERE k1 = 'foo'
ORDER BY val ASC;

SELECT val
FROM `03720_updates`
WHERE (k1, k2) = (1, 1);

SELECT val
FROM `03720_updates`
WHERE (k1, k2) = (1, 2);

SELECT val
FROM `03720_updates`
WHERE (k1, k2) = (2, 1);

SELECT COUNT(*)
FROM `03720_updates`;

SELECT val
FROM `03720_updates_three_col`
WHERE (k1, k2, k3) = (1, 1, 1);

SELECT COUNT(*)
FROM `03720_updates_three_col`;

SELECT val
FROM `03720_updates_string`
WHERE (k1, k2) = ('foo', 'bar');

SELECT COUNT(*)
FROM `03720_updates_string`;

SELECT val
FROM `03720_upsert`
WHERE (k1, k2) = (1, 1);

SELECT val
FROM `03720_upsert`
WHERE (k1, k2) = (2, 2);

SELECT COUNT(*)
FROM `03720_upsert`;

SELECT
    l.val,
    r.info
FROM
    `03720_join_left` AS l
INNER JOIN `03720_join_right` AS r
    ON l.k1 = r.k1
    AND l.k2 = r.k2
ORDER BY l.val ASC;

SELECT
    l.val,
    r.info
FROM
    `03720_join_left` AS l
LEFT JOIN `03720_join_right` AS r
    ON l.k1 = r.k1
    AND l.k2 = r.k2
ORDER BY l.val ASC;

SELECT COUNT(*)
FROM
    `03720_join_left` AS l
INNER JOIN `03720_join_right` AS r
    ON l.k1 = r.k1
    AND l.k2 = r.k2;

SELECT
    l.val,
    r.info
FROM
    `03720_join_three_left` AS l
INNER JOIN `03720_join_three_right` AS r
    ON l.k1 = r.k1
    AND l.k2 = r.k2
    AND l.k3 = r.k3
ORDER BY l.val ASC;

SELECT COUNT(*)
FROM
    `03720_join_three_left` AS l
LEFT JOIN `03720_join_three_right` AS r
    ON l.k1 = r.k1
    AND l.k2 = r.k2
    AND l.k3 = r.k3;

SELECT
    l.val,
    r.val
FROM
    `03720_join_str_left` AS l
INNER JOIN `03720_join_str_right` AS r
    ON l.k1 = r.k1
    AND l.k2 = r.k2
ORDER BY l.val ASC;

SELECT COUNT(*)
FROM
    `03720_join_str_left` AS l
LEFT JOIN `03720_join_str_right` AS r
    ON l.k1 = r.k1
    AND l.k2 = r.k2;

SELECT
    r.val,
    m.info
FROM
    `03720_join_rocks` AS r
INNER JOIN `03720_join_merge` AS m
    ON r.k1 = m.k1
    AND r.k2 = m.k2
ORDER BY r.val ASC;

SELECT COUNT(*)
FROM
    `03720_join_rocks` AS r
LEFT JOIN `03720_join_merge` AS m
    ON r.k1 = m.k1
    AND r.k2 = m.k2;