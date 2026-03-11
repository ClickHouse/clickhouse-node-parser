SELECT extractAllGroupsVertical();

SELECT extractAllGroupsVertical('hello');

SELECT extractAllGroupsVertical('hello', 123);

SELECT extractAllGroupsVertical(123, 'world');

SELECT extractAllGroupsVertical('hello world', '(((');

SELECT extractAllGroupsVertical('hello world', materialize('\\w+'));

SELECT extractAllGroupsVertical('hello world', '\\w+');

SELECT extractAllGroupsVertical('hello world', '(\\w+)');

SELECT extractAllGroupsVertical('hello world', CAST('(\\w+)' AS FixedString(5)));

SELECT extractAllGroupsVertical(CAST('hello world' AS FixedString(12)), '(\\w+)');

SELECT extractAllGroupsVertical(CAST('hello world' AS FixedString(12)), CAST('(\\w+)' AS FixedString(5)));

SELECT extractAllGroupsVertical(materialize(CAST('hello world' AS FixedString(12))), '(\\w+)');

SELECT extractAllGroupsVertical(materialize(CAST('hello world' AS FixedString(12))), CAST('(\\w+)' AS FixedString(5)));

SELECT extractAllGroupsVertical('abc=111, def=222, ghi=333 "jkl mno"="444 foo bar"', '("[^"]+"|\\w+)=("[^"]+"|\\w+)');

SELECT
    length(haystack),
    length(matches[1]),
    length(matches),
    arrayMap(x -> length(x), arrayMap(x -> x[1], matches))
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractAllGroupsVertical(haystack, '(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz)') AS matches
        FROM numbers(3)
    );

SELECT
    length(haystack),
    length(matches[1]),
    length(matches),
    arrayReduce('sum', arrayMap(x -> length(x), arrayMap(x -> x[1], matches)))
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractAllGroupsVertical(haystack, '(\\w)') AS matches
        FROM numbers(3)
    );

SELECT
    length(haystack),
    length(matches[1]),
    length(matches),
    arrayMap(x -> length(x), arrayMap(x -> x[1], matches))
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractAllGroupsVertical(haystack, repeat('(\\w)', 100)) AS matches
        FROM numbers(3)
    );