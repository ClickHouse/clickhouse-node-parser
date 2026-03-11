SELECT
    sum(toUInt64(str)),
    sum(toUInt64(s))
FROM lc_prewhere
PREWHERE val == 1;