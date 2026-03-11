-- Projection query works without mutation applied.
SELECT count(j) FROM t GROUP BY name, age;
