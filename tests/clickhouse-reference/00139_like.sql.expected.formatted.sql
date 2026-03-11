SELECT count()
FROM test.hits
WHERE like(URL, '%/avtomobili_s_probegom/_%__%__%__%');

SELECT count()
FROM test.hits
WHERE like(URL, '/avtomobili_s_probegom/_%__%__%__%');

SELECT count()
FROM test.hits
WHERE like(URL, '%_/avtomobili_s_probegom/_%__%__%__%');

SELECT count()
FROM test.hits
WHERE like(URL, '%avtomobili%');