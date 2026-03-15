CREATE TABLE t
(
    k String
)
ORDER BY k AS
SELECT concat('dst_', number)
FROM numbers(10);

SELECT count(*)
FROM t
WHERE like(k, 'dst_kkkk_1111%');

SELECT count(*)
FROM t
WHERE like(k, 'dst%kkkk');