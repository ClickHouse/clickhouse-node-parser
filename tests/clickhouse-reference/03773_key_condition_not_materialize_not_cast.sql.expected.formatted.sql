SELECT val
FROM t_cast_bug
WHERE NOT CAST(val = 0, 'UInt8')
ORDER BY val ASC;

SELECT val
FROM v
WHERE NOT is_zero
ORDER BY val ASC;