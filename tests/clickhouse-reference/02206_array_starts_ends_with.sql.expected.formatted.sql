SELECT startsWith([], []);

SELECT startsWith([1], []);

SELECT startsWith([], [1]);

SELECT startsWith([NULL], [NULL]);

SELECT startsWith([NULL], []);

SELECT startsWith([], [NULL]);

SELECT startsWith([NULL, 1], [NULL]);

SELECT startsWith([NULL, 1], [1]);

SELECT startsWith([1, 2, 3, 4], [1, 2, 3]);

SELECT startsWith([1, 2, 3, 4], [1, 2, 4]);

SELECT startsWith(['a', 'b', 'c'], ['a', 'b']);

SELECT startsWith(['a', 'b', 'c'], ['b']);

SELECT endsWith([], []);

SELECT endsWith([1], []);

SELECT endsWith([], [1]);

SELECT endsWith([NULL], [NULL]);

SELECT endsWith([NULL], []);

SELECT endsWith([], [NULL]);

SELECT endsWith([1, NULL], [NULL]);

SELECT endsWith([NULL, 1], [NULL]);

SELECT endsWith([1, 2, 3, 4], [3, 4]);

SELECT endsWith([1, 2, 3, 4], [3]);

SELECT startsWith([1], emptyArrayUInt8());

SELECT endsWith([1], emptyArrayUInt8());