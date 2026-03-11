SELECT arrayResize([1, 2, 3], 10);

SELECT arrayResize([1, 2, 3], -10);

SELECT arrayResize([1, Null, 3], 10);

SELECT arrayResize([1, Null, 3], -10);

SELECT arrayResize([1, 2, 3, 4, 5, 6], 3);

SELECT arrayResize([1, 2, 3, 4, 5, 6], -3);

SELECT arrayResize([1, 2, 3], 5, 42);

SELECT arrayResize([1, 2, 3], -5, 42);

SELECT arrayResize(['a', 'b', 'c'], 5);

SELECT arrayResize([[1, 2], [3, 4]], 4);

SELECT arrayResize([[1, 2], [3, 4]], -4);

SELECT arrayResize([[1, 2], [3, 4]], 4, [5, 6]);

SELECT arrayResize([[1, 2], [3, 4]], -4, [5, 6]);

SELECT arrayResize([1, 2, 3], 5, 423.56);

SELECT arrayResize([1, 2, 3], toNullable(3));

SELECT arrayResize(materialize([1]), toNullable(3));