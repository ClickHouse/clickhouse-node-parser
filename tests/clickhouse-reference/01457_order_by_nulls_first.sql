SELECT
    diff,
    traf
FROM order_by_nulls_first
order by diff desc NULLS FIRST, traf
limit 1, 4;
select '--- DESC NULLS FIRST, ASC';
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC NULLS FIRST,
    traf ASC;
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC NULLS LAST,
    traf ASC;
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC NULLS FIRST,
    traf ASC;
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC NULLS LAST,
    traf ASC;
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC NULLS FIRST,
    traf DESC;
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC NULLS LAST,
    traf DESC;
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC NULLS FIRST,
    traf DESC;
SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC NULLS LAST,
    traf DESC;
