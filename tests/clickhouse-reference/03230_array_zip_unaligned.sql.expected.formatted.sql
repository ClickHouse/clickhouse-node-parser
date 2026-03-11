SELECT
    arrayZipUnaligned(['a', 'b', 'c'], ['d', 'e', 'f']) AS x,
    toTypeName(x);

SELECT arrayZipUnaligned(['a', 'b', 'c'], ['d', 'e', 'f'], ['g', 'h', 'i']);

SELECT arrayZipUnaligned();

SELECT arrayZipUnaligned('a', 'b', 'c');

SELECT arrayZipUnaligned(['a', 'b', 'c'], ['d', 'e', 'f', 'g']);

SELECT arrayZipUnaligned(['a'], [1, 2, 3]);

SELECT arrayZipUnaligned(['a', 'b', 'c'], [1, 2], [1.1, 2.2, 3.3, 4.4]);

SELECT arrayZipUnaligned(materialize(['g', 'h', 'i']))
FROM numbers(3);