SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', 1);

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)');

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', 2);

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', 0);

SELECT regexpExtract('100-200', '(\\d+).*', 1);

SELECT regexpExtract('100-200', '([a-z])', 1);

SELECT regexpExtract(NULL, '([a-z])', 1);

SELECT regexpExtract('100-200', NULL, 1);

SELECT regexpExtract('100-200', '([a-z])', NULL);

SELECT REGEXP_EXTRACT('100-200', '(\\d+)-(\\d+)', 1);

SELECT REGEXP_EXTRACT('100-200', '(\\d+)-(\\d+)');

SELECT REGEXP_EXTRACT('100-200', '(\\d+)-(\\d+)', 0);

SELECT regexpExtract('0123456789', '(\\d+)(\\d+)', 0);

SELECT regexpExtract('0123456789', '(\\d+)(\\d+)', 1);

SELECT regexpExtract('0123456789', '(\\d+)(\\d+)', 2);

SELECT regexpExtract(materialize('100-200'), '(\\d+)-(\\d+)');

SELECT regexpExtract(materialize('100-200'), '(\\d+)-(\\d+)', 1);

SELECT regexpExtract(materialize('100-200'), '(\\d+)-(\\d+)', 2);

SELECT regexpExtract(materialize('100-200'), '(\\d+).*', 1);

SELECT regexpExtract(materialize('100-200'), '([a-z])', 1);

SELECT regexpExtract(materialize(NULL), '([a-z])', 1);

SELECT regexpExtract(materialize('100-200'), NULL, 1);

SELECT regexpExtract(materialize('100-200'), '([a-z])', NULL);

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', materialize(1));

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', materialize(2));

SELECT regexpExtract('100-200', '(\\d+).*', materialize(1));

SELECT regexpExtract('100-200', '([a-z])', materialize(1));

SELECT regexpExtract(NULL, '([a-z])', materialize(1));

SELECT regexpExtract('100-200', NULL, materialize(1));

SELECT regexpExtract('100-200', '([a-z])', materialize(NULL));

SELECT regexpExtract(materialize('100-200'), '(\\d+)-(\\d+)', materialize(1));

SELECT regexpExtract(materialize('100-200'), '(\\d+)-(\\d+)', materialize(2));

SELECT regexpExtract(materialize('100-200'), '(\\d+).*', materialize(1));

SELECT regexpExtract(materialize('100-200'), '([a-z])', materialize(1));

SELECT regexpExtract(materialize(NULL), '([a-z])', materialize(1));

SELECT regexpExtract(materialize('100-200'), NULL, materialize(1));

SELECT regexpExtract(materialize('100-200'), '([a-z])', materialize(NULL));

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', number)
FROM numbers(3);

SELECT regexpExtract(materialize('100-200'), '(\\d+)-(\\d+)', number)
FROM numbers(3);

SELECT regexpExtract(concat(number::String, '-', ((2 * number))::String), '(\\d+)-(\\d+)', 1)
FROM numbers(3);

SELECT regexpExtract(concat(number::String, '-', ((2 * number))::String), '(\\d+)-(\\d+)', number % 3)
FROM numbers(5);

SELECT regexpExtract('100-200100-200', '(\\d+)-(\\d+)(\\d+)-(\\d+)', materialize(3));

SELECT regexpExtract('100-200');

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', 1, 2);

SELECT regexpExtract(CAST('100-200' AS FixedString(10)), '(\\d+)-(\\d+)', 1);

SELECT regexpExtract('100-200', CAST('(\\d+)-(\\d+)' AS FixedString(20)), 1);

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', 'a');

SELECT regexpExtract(100, '(\\d+)-(\\d+)', 1);

SELECT regexpExtract('100-200', 1, 1);

SELECT regexpExtract('100-200', materialize('(\\d+)-(\\d+)'), 1);

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', 3);

SELECT regexpExtract('100-200', '(\\d+)-(\\d+)', -1);

SELECT regexpExtract('100-200', '\\d+-\\d+', 0);

SELECT regexpExtract('100-200', '\\d+-\\d+', 1);