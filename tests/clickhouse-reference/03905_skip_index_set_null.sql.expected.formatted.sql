SELECT
    id,
    val
FROM t_skip_index_null
WHERE val = 'a'
ORDER BY id ASC;

SELECT
    id,
    val
FROM t_skip_index_null
WHERE isNull(val)
ORDER BY id ASC;

SELECT count()
FROM t_skip_index_null
WHERE val = 'nonexistent';