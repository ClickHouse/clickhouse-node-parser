CREATE TABLE rollup_having (
  a Nullable(String),
  b Nullable(String)
) ENGINE = Memory;
SELECT a, b, count(*) FROM rollup_having GROUP BY a, b WITH ROLLUP WITH TOTALS HAVING a IS NOT NULL; -- { serverError NOT_IMPLEMENTED }
SELECT a, b, count(*) FROM rollup_having GROUP BY a, b WITH ROLLUP WITH TOTALS HAVING a IS NOT NULL and b IS NOT NULL; -- { serverError NOT_IMPLEMENTED }
