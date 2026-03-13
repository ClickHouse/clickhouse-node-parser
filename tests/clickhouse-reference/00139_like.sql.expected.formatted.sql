-- Tags: stateful
/* Note that queries are written as the user doesn't really understand that the symbol _ has special meaning in LIKE pattern. */
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