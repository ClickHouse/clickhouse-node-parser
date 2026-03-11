SELECT
    *,
    arr
FROM
    lc_left_aj
LEFT ARRAY JOIN str AS arr;

SELECT
    *,
    arr
FROM
    lc_left_aj
LEFT ARRAY JOIN null_str AS arr;

SELECT
    *,
    arr
FROM
    lc_left_aj
LEFT ARRAY JOIN val AS arr;

SELECT
    *,
    arr
FROM
    lc_left_aj
LEFT ARRAY JOIN null_val AS arr;