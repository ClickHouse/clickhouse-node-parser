SELECT count()
FROM constraint_test_assumption
WHERE domainWithoutWWW(URL) = 'bigmir.net';

SELECT count()
FROM constraint_test_assumption
WHERE NOT domainWithoutWWW(URL) = 'bigmir.net';

SELECT count()
FROM constraint_test_assumption
WHERE domainWithoutWWW(URL) != 'bigmir.net';

SELECT count()
FROM constraint_test_assumption
WHERE domainWithoutWWW(URL) = 'nothing';

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND URL > 'zzz');

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND NOT URL <= 'zzz');

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND URL > 'zzz')
    OR (a = 10
    AND a + 5 < 100);

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND URL = '111');

SELECT count()
FROM constraint_test_assumption
WHERE (startsWith(URL, 'test') = true);

SELECT count()
FROM constraint_test_transitivity
WHERE a = d;

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a = d;

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a = c
    AND b = d;

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a < c
    OR b < d;

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a <= c
    OR b <= d;

SELECT count()
FROM constraint_test_transitivity2
WHERE a > d;

SELECT count()
FROM constraint_test_transitivity2
WHERE a >= d;

SELECT count()
FROM constraint_test_transitivity2
WHERE d < a;

SELECT count()
FROM constraint_test_transitivity2
WHERE a < d;

SELECT count()
FROM constraint_test_transitivity2
WHERE a = d;

SELECT count()
FROM constraint_test_transitivity2
WHERE a != d;

SELECT count()
FROM constraint_test_transitivity3
WHERE a < b;

SELECT count()
FROM constraint_test_transitivity3
WHERE b >= a;

SELECT count()
FROM constraint_test_constants_repl
WHERE a - b = 10;

SELECT count()
FROM constraint_test_constants_repl
WHERE a - b < 0;

SELECT count()
FROM constraint_test_constants_repl
WHERE a - b = c + d;

SELECT count()
FROM constraint_test_constants_repl
WHERE ((a - b)) * 2 = c + d;

SELECT count()
FROM constraint_test_constants
WHERE 9 < b;

SELECT count()
FROM constraint_test_constants
WHERE 11 < b;

SELECT count()
FROM constraint_test_constants
WHERE 10 <= b;

SELECT count()
FROM constraint_test_constants
WHERE 9 < a;

SELECT count()
FROM constraint_test_constants
WHERE 10 < a;

SELECT count()
FROM constraint_test_constants
WHERE 10 <= a;

SELECT count()
FROM constraint_test_constants
WHERE 9 <= a;

SELECT count()
FROM constraint_test_constants
WHERE 11 <= a;