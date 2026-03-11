SELECT 1 = position('', '');

SELECT 1 = position('abc', '');

SELECT 0 = position('', 'abc');

SELECT 1 = position('abc', 'abc');

SELECT 2 = position('abc', 'bc');

SELECT 3 = position('abc', 'c');

SELECT 1 = position('абв', '');

SELECT 0 = position('', 'абв');

SELECT 1 = position('абв', 'абв');

SELECT 3 = position('абв', 'бв');

SELECT 5 = position('абв', 'в');

SELECT 6 = position(s, '/')
FROM (
        SELECT 'Hello/World' AS s
    );