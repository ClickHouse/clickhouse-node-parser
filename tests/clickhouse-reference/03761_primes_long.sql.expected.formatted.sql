SELECT prime
FROM `system`.primes
WHERE bitAnd(prime, prime + 1) = 0
LIMIT 7;

SELECT prime
FROM `system`.primes
WHERE bitAnd(prime, prime + 1) = 0
LIMIT 4
OFFSET 3;

SELECT count()
FROM `system`.primes
WHERE prime < 1000000000;