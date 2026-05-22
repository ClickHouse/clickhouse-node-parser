SELECT makeDateTime(1991, 8, 24, 21, 4, 0);

SELECT makeDateTime(1991, 8, 24, 21, 4, 0, 'CET');

SELECT CAST(makeDateTime(1991, 8, 24, 21, 4, 0, 'CET') AS DateTime('UTC'));

SELECT toTypeName(makeDateTime(1991, 8, 24, 21, 4, 0));

SELECT toTypeName(makeDateTime(1991, 8, 24, 21, 4, 0, 'CET'));

SELECT makeDateTime(1925, 1, 1, 0, 0, 0, 'UTC');

SELECT makeDateTime(1924, 12, 31, 23, 59, 59, 'UTC');

SELECT makeDateTime(2283, 11, 11, 23, 59, 59, 'UTC');

SELECT makeDateTime(2283, 11, 12, 0, 0, 0, 'UTC');

SELECT makeDateTime(2262, 4, 11, 23, 47, 16, 'UTC');

SELECT makeDateTime(2262, 4, 11, 23, 47, 17, 'UTC');

SELECT makeDateTime(1984, 0, 1, 0, 0, 0, 'UTC');

SELECT makeDateTime(1984, 1, 0, 0, 0, 0, 'UTC');

SELECT makeDateTime(1984, 13, 1, 0, 0, 0, 'UTC');

SELECT makeDateTime(1984, 1, 41, 0, 0, 0, 'UTC');

SELECT makeDateTime(1984, 1, 1, 25, 0, 0, 'UTC');

SELECT makeDateTime(1984, 1, 1, 0, 70, 0, 'UTC');

SELECT makeDateTime(1984, 1, 1, 0, 0, 70, 'UTC');

SELECT makeDateTime(1984, 1, 1, 0, 0, 0, 'not a timezone'); -- { serverError BAD_ARGUMENTS }

SELECT makeDateTime(1984, 1, 1, 0, 0, 0, 'UTC');

SELECT makeDateTime(1983, 2, 29, 0, 0, 0, 'UTC');

SELECT makeDateTime(-1984, 1, 1, 0, 0, 0, 'UTC');

SELECT makeDateTime(1984, -1, 1, 0, 0, 0, 'UTC');

SELECT makeDateTime(1984, 1, -1, 0, 0, 0, 'UTC');

SELECT makeDateTime(1984, 1, 1, -1, 0, 0, 'UTC');

SELECT makeDateTime(1984, 1, 1, 0, -1, 0, 'UTC');

SELECT makeDateTime(1984, 1, 1, 0, 0, -1, 'UTC');

SELECT makeDateTime(65537, 8, 24, 21, 4, 0, 'UTC');

SELECT makeDateTime(1991, 65537, 24, 21, 4, 0, 'UTC');

SELECT makeDateTime(1991, 8, 65537, 21, 4, 0, 'UTC');

SELECT makeDateTime(1991, 8, 24, 65537, 4, 0, 'UTC');

SELECT makeDateTime(1991, 8, 24, 21, 65537, 0, 'UTC');

SELECT makeDateTime(1991, 8, 24, 21, 4, 65537, 'UTC');