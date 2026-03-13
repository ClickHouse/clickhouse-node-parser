-- Invalid sign does not show up in result of SELECT ... FINAL
SELECT *
FROM t_03291_collapsing_invalid_sign FINAL;

-- But it is still there
SELECT *
FROM t_03291_collapsing_invalid_sign
WHERE sign = 2;

-- Should only show the last inserted row with valid sign
SELECT *
FROM t0 FINAL;

SELECT *
FROM t0;

SELECT 1
FROM t0 FINAL;