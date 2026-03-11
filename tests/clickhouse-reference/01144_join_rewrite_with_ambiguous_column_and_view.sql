SELECT t1.id, t2.id as id, t3.id as value
FROM (select number as id, 42 as value from numbers(4)) t1
LEFT JOIN (select number as id, 42 as value from numbers(3)) t2 ON t1.id = t2.id
LEFT JOIN (select number as id, 42 as value from numbers(2)) t3 ON t1.id = t3.id
WHERE id > 0 AND value < 42 ORDER BY id;
SELECT * FROM view1 WHERE id = 1 ORDER BY id;
