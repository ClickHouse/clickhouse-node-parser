-- DISTINCT has to be removed since the view already has DISTINCT on the same column
SELECT count()
FROM
(
    EXPLAIN SELECT DISTINCT x FROM tab_v
)
WHERE explain ILIKE '%distinct%';
SELECT DISTINCT x FROM tab_v ORDER BY x;
-- explicitly checking that materialize() doesn't affect the result, - redundant DISTINCT is still removed
SELECT count()
FROM
(
    EXPLAIN SELECT DISTINCT x FROM (SELECT materialize(x) as x FROM (select DISTINCT x from tab))
)
WHERE explain ILIKE '%distinct%';
