SELECT vec.0
FROM qbit; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }

SELECT vec.17
FROM qbit; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }

SELECT bin(vec.1)
FROM qbit;

SELECT bin(vec.4)
FROM qbit;

SELECT bin(vec.15)
FROM qbit;

SELECT bin(vec.16)
FROM qbit;

SELECT bin(vec.1)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.2)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.7)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.15)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.23)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.31)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.39)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.47)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.55)
FROM qbit
ORDER BY id ASC;

SELECT bin(vec.63)
FROM qbit
ORDER BY id ASC;