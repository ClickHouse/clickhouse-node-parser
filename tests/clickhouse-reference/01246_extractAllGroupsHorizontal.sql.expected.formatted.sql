SELECT extractAllGroupsHorizontal();

SELECT extractAllGroupsHorizontal('hello');

SELECT extractAllGroupsHorizontal('hello', 123);

SELECT extractAllGroupsHorizontal(123, 'world');

SELECT extractAllGroupsHorizontal('hello world', '(((');

SELECT extractAllGroupsHorizontal('hello world', materialize('\\w+'));

SELECT extractAllGroupsHorizontal('hello world', '\\w+');

SELECT extractAllGroupsHorizontal('hello world', '(\\w+)')
SETTINGS regexp_max_matches_per_row = 0;

SELECT extractAllGroupsHorizontal('hello world', '(\\w+)')
SETTINGS regexp_max_matches_per_row = 1;

SELECT extractAllGroupsHorizontal('hello world', '(\\w+)')
SETTINGS regexp_max_matches_per_row = 1000000
FORMAT Null;

SELECT extractAllGroupsHorizontal('hello world', '(\\w+)');

SELECT extractAllGroupsHorizontal('hello world', CAST('(\\w+)' AS FixedString(5)));

SELECT extractAllGroupsHorizontal(CAST('hello world' AS FixedString(12)), '(\\w+)');

SELECT extractAllGroupsHorizontal(CAST('hello world' AS FixedString(12)), CAST('(\\w+)' AS FixedString(5)));

SELECT extractAllGroupsHorizontal(materialize(CAST('hello world' AS FixedString(12))), '(\\w+)');

SELECT extractAllGroupsHorizontal(materialize(CAST('hello world' AS FixedString(12))), CAST('(\\w+)' AS FixedString(5)));

SELECT extractAllGroupsHorizontal('abc=111, def=222, ghi=333 "jkl mno"="444 foo bar"', '("[^"]+"|\\w+)=("[^"]+"|\\w+)');

SELECT
    length(haystack),
    length(matches),
    length(matches[1]),
    arrayMap(x -> length(x), matches[1])
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractAllGroupsHorizontal(haystack, '(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz)') AS matches
        FROM numbers(3)
    );

SELECT
    length(haystack),
    length(matches),
    length(matches[1]),
    arrayReduce('sum', arrayMap(x -> length(x), matches[1]))
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractAllGroupsHorizontal(haystack, '(\\w)') AS matches
        FROM numbers(3)
    );

SELECT
    length(haystack),
    length(matches),
    length(matches[1]),
    arrayMap(x -> length(x), matches[1])
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractAllGroupsHorizontal(haystack, repeat('(\\w)', 100)) AS matches
        FROM numbers(3)
    );