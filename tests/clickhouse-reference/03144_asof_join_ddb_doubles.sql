SELECT p.ts, e.value
FROM
    (SELECT number :: Float64 AS ts FROM numbers(10)) p
ASOF  JOIN events0 e
ON p.ts >= e.begin
ORDER BY p.ts ASC;
SELECT p.ts, e.value
FROM
    (SELECT number :: Float64 AS ts FROM numbers(10)) p
ASOF LEFT JOIN events0 e
ON p.ts >= e.begin
ORDER BY p.ts ASC
-- SETTINGS join_use_nulls = 1
;
SELECT p.key, p.ts, e.value
FROM probes p
ASOF JOIN events e
ON p.key = e.key AND p.ts >= e.begin
ORDER BY p.key, p.ts ASC;
SELECT p.key, p.ts, e.value
FROM probes p
ASOF LEFT JOIN events e
ON p.key = e.key AND p.ts >= e.begin
ORDER BY p.key, p.ts ASC NULLS FIRST;
