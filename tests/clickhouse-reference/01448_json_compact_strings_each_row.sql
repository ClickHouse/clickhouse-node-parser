SELECT 1;
SELECT * FROM test_table FORMAT JSONCompactStringsEachRow;
SELECT 2;
/* Check Totals */
SELECT name, count() AS c FROM test_table GROUP BY name WITH TOTALS ORDER BY name FORMAT JSONCompactStringsEachRow;
SELECT 3;
/* Check JSONCompactStringsEachRowWithNames and JSONCompactStringsEachRowWithNamesAndTypes Output */
SELECT * FROM test_table FORMAT JSONCompactStringsEachRowWithNamesAndTypes;
SELECT '----------';
SELECT * FROM test_table FORMAT JSONCompactStringsEachRowWithNames;
SELECT 4;
/* Check Totals */
SELECT name, count() AS c FROM test_table GROUP BY name WITH TOTALS ORDER BY name FORMAT JSONCompactStringsEachRowWithNamesAndTypes;
SELECT 5;
SELECT 6;
SELECT 7;
SELECT * FROM test_table_2 FORMAT JSONCompactStringsEachRow;
SELECT 8;
SELECT 9;
SELECT 10;
SELECT 11;
SELECT 12;
SELECT * FROM test_table_2 FORMAT JSONCompactStringsEachRowWithNamesAndTypes;
SELECT * FROM test_table_2 FORMAT JSONCompactStringsEachRowWithNames;
