SELECT count(*)
FROM `03732_table`; -- Expecting 3

SELECT count(*)
FROM `03732_table_mv_dst`; -- Expecting 3

SELECT count(*)
FROM `03732_table_join_mv`; -- Expecting 3

SELECT *
FROM `03732_table_join_mv`
ORDER BY id ASC;