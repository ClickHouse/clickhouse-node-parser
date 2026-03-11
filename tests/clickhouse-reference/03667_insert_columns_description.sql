SELECT '-- remote table function columns description';
SELECT * FROM t0 ORDER BY ALL;
SELECT * FROM file(database() || '_test.csv') ORDER BY ALL;
