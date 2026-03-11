SELECT p.begin, e.begin, e.value
FROM probe0 p
ASOF JOIN events0 e
ON p.begin > e.begin
ORDER BY p.begin ASC;
SELECT p.begin, e.begin, e.value
FROM probe0 p
ASOF LEFT JOIN events0 e
ON p.begin > e.begin
ORDER BY p.begin ASC;
SELECT p.begin, e.begin, e.value
FROM probe0 p
ASOF JOIN events0 e
ON p.begin <= e.begin
ORDER BY p.begin ASC;
SELECT p.begin, e.begin, e.value
FROM probe0 p
ASOF LEFT JOIN events0 e
ON p.begin <= e.begin
ORDER BY p.begin ASC;
SELECT p.begin, e.begin, e.value
FROM probe0 p
ASOF JOIN events0 e
ON p.begin < e.begin
ORDER BY p.begin ASC;
SELECT p.begin, e.begin, e.value
FROM probe0 p
ASOF LEFT JOIN events0 e
ON p.begin < e.begin
ORDER BY p.begin ASC;
