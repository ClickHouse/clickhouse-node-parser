SELECT 1;
SELECT * FROM test_table FORMAT JSONCompactEachRow;
SELECT 2;
/* Check Totals */
SELECT name, count() AS c FROM test_table GROUP BY name WITH TOTALS ORDER BY name FORMAT JSONCompactEachRow;
SELECT 3;
/* Check JSONCompactEachRowWithNames and JSONCompactEachRowWithNamesAndTypes Output */
SELECT * FROM test_table FORMAT JSONCompactEachRowWithNamesAndTypes;
SELECT '----------';
SELECT * FROM test_table FORMAT JSONCompactEachRowWithNames;
SELECT 4;
/* Check Totals */
SELECT name, count() AS c FROM test_table GROUP BY name WITH TOTALS ORDER BY name FORMAT JSONCompactEachRowWithNamesAndTypes;
SELECT 5;
SELECT 6;
SELECT 7;
SELECT * FROM test_table_2 FORMAT JSONCompactEachRow;
SELECT 8;
SELECT 9;
SELECT 10;
SELECT 11;
SELECT 12;
SELECT * FROM test_table_2 FORMAT JSONCompactEachRowWithNamesAndTypes;
SELECT * FROM test_table_2 FORMAT JSONCompactEachRowWithNames;
