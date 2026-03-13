SELECT count()
FROM constraint_test_assumption
WHERE domainWithoutWWW(URL) = 'bigmir.net'; --- assumption -> 4

SELECT count()
FROM constraint_test_assumption
WHERE NOT domainWithoutWWW(URL) = 'bigmir.net'; --- assumption -> 0

SELECT count()
FROM constraint_test_assumption
WHERE domainWithoutWWW(URL) != 'bigmir.net'; --- assumption -> 0

SELECT count()
FROM constraint_test_assumption
WHERE domainWithoutWWW(URL) = 'nothing'; --- not optimized -> 0

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND URL > 'zzz'); ---> assumption -> 4

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND NOT URL <= 'zzz'); ---> assumption -> 4

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND URL > 'zzz')
    OR (a = 10
    AND a + 5 < 100); ---> assumption -> 4

SELECT count()
FROM constraint_test_assumption
WHERE (domainWithoutWWW(URL) = 'bigmir.net'
    AND URL = '111'); ---> assumption & no assumption -> 0

SELECT count()
FROM constraint_test_assumption
WHERE (startsWith(URL, 'test') = true); ---> assumption -> 4

SELECT count()
FROM constraint_test_transitivity
WHERE a = d; ---> assumption -> 1

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a = d; ---> assumption -> 1

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a = c
    AND b = d; ---> assumption -> 1

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a < c
    OR b < d; ---> assumption -> 0

SELECT count()
FROM constraint_test_strong_connectivity
WHERE a <= c
    OR b <= d; ---> assumption -> 1

SELECT count()
FROM constraint_test_transitivity2
WHERE a > d; ---> assumption -> 1

SELECT count()
FROM constraint_test_transitivity2
WHERE a >= d; ---> assumption -> 1

SELECT count()
FROM constraint_test_transitivity2
WHERE d < a; ---> assumption -> 1

SELECT count()
FROM constraint_test_transitivity2
WHERE a < d; ---> assumption -> 0

SELECT count()
FROM constraint_test_transitivity2
WHERE a = d; ---> assumption -> 0

SELECT count()
FROM constraint_test_transitivity2
WHERE a != d; ---> assumption -> 1

SELECT count()
FROM constraint_test_transitivity3
WHERE a < b; ---> assumption -> 1

SELECT count()
FROM constraint_test_transitivity3
WHERE b >= a; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants_repl
WHERE a - b = 10; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants_repl
WHERE a - b < 0; ---> assumption -> 0

SELECT count()
FROM constraint_test_constants_repl
WHERE a - b = c + d; ---> assumption -> 0

SELECT count()
FROM constraint_test_constants_repl
WHERE ((a - b)) * 2 = c + d; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants
WHERE 9 < b; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants
WHERE 11 < b; ---> assumption -> 0

SELECT count()
FROM constraint_test_constants
WHERE 10 <= b; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants
WHERE 9 < a; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants
WHERE 10 < a; ---> assumption -> 0

SELECT count()
FROM constraint_test_constants
WHERE 10 <= a; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants
WHERE 9 <= a; ---> assumption -> 1

SELECT count()
FROM constraint_test_constants
WHERE 11 <= a; ---> assumption -> 0