CREATE TABLE nulls_first_sort_test (a Nullable(Int32), b Nullable(Int32), c Nullable(Int32)) ENGINE = Memory;
SELECT * FROM nulls_first_sort_test ORDER BY a NULLS FIRST,b NULLS FIRST,c NULLS FIRST LIMIT 5;
