SELECT count() FROM (SELECT * FROM test_03444_lazy WHERE n >= 0 ORDER BY rand() LIMIT 5);
select trimLeft(explain) as s from (EXPLAIN SELECT * FROM test_03444_lazy WHERE n >= 0 ORDER BY rand() LIMIT 5) where s ilike 'LazilyRead%';
