SELECT
    tv.key,
    toString(tv.t, 'UTC'),
    md.bid,
    tv.tv,
    md.ask
FROM
    tv
LEFT JOIN md
    USING (key, t)
ORDER BY (tv.key, tv.t) ASC;

SELECT
    tv.key,
    toString(tv.t, 'UTC'),
    md.bid,
    tv.tv,
    md.ask
FROM
    tv
LEFT JOIN md
    USING (key, t)
ORDER BY (tv.key, tv.t) ASC
SETTINGS join_algorithm = 'full_sorting_merge';