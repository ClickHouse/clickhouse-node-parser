SELECT *
FROM pk_func
ORDER BY
    toDate(d) ASC,
    ui ASC
LIMIT 5;

SELECT *
FROM nORX
WHERE B >= 1000
ORDER BY
    A ASC,
    negate(B) ASC
LIMIT 3
SETTINGS max_threads = 1;