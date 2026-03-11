SELECT count()
FROM samples
WHERE key IN (range(10));

SELECT count()
FROM samples
WHERE key IN (arraySlice(range(100), 5, 10));

SELECT count()
FROM samples
WHERE toUInt64(key) IN (range(100));

SELECT count()
FROM samples
WHERE key IN (arraySlice(range(100), 10, 10));

SELECT 'a' IN (splitByChar('c', 'abcdef'));

SELECT count()
FROM samples
WHERE 1 IN (range(samples.value));

SELECT count()
FROM samples
WHERE 1 IN (range(rand() % 1000 + 2));

SELECT count()
FROM samples
WHERE value IN (range(3));

SELECT 123 IN (splitByChar('c', 'abcdef'));