SELECT
    sum(toUInt64(str)),
    sum(toUInt64(pat))
FROM lc_dict_reading
WHERE val < 8129
    OR val > 8192 * 4;