SELECT
    str,
    str IN ('a', 'd')
FROM lc_00688;

SELECT
    val,
    val IN (1, 3)
FROM lc_00688;

SELECT
    str,
    str IN (
        SELECT arrayJoin(['a', 'd'])
    )
FROM lc_00688;

SELECT
    val,
    val IN (
        SELECT arrayJoin([1, 3])
    )
FROM lc_00688;

SELECT
    str,
    str IN (
        SELECT str
        FROM lc_00688
    )
FROM lc_00688;

SELECT
    val,
    val IN (
        SELECT val
        FROM lc_00688
    )
FROM lc_00688;

SELECT v
FROM ary_lc_null
WHERE v IN (
        SELECT v
        FROM ary_lc_null
    );