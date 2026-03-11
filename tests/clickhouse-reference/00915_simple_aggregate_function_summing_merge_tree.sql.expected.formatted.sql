SELECT *
FROM simple;

SELECT *
FROM simple FINAL
ORDER BY id ASC;

SELECT toTypeName(val)
FROM simple
LIMIT 1;

SELECT
    toTypeName(nullable_str),
    toTypeName(nullable_str_respect_nulls),
    toTypeName(low_str),
    toTypeName(ip),
    toTypeName(status),
    toTypeName(tup),
    toTypeName(tup_min),
    toTypeName(tup_max),
    toTypeName(arr),
    toTypeName(uniq_arr),
    toTypeName(map_uniq_arr)
FROM simple
LIMIT 1;

SELECT
    'with_overflow',
    *
FROM with_overflow;