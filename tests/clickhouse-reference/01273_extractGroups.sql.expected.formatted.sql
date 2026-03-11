SELECT extractGroups();

SELECT extractGroups('hello');

SELECT extractGroups('hello', 123);

SELECT extractGroups(123, 'world');

SELECT extractGroups('hello world', '(((');

SELECT extractGroups('hello world', materialize('\\w+'));

SELECT extractGroups('hello world', '\\w+');

SELECT extractGroups('hello world', '(\\w+) (\\w+)');

SELECT extractGroups('hello world', CAST('(\\w+) (\\w+)' AS FixedString(11)));

SELECT extractGroups(CAST('hello world' AS FixedString(12)), '(\\w+) (\\w+)');

SELECT extractGroups(CAST('hello world' AS FixedString(12)), CAST('(\\w+) (\\w+)' AS FixedString(11)));

SELECT extractGroups(materialize(CAST('hello world' AS FixedString(12))), '(\\w+) (\\w+)');

SELECT extractGroups(materialize(CAST('hello world' AS FixedString(12))), CAST('(\\w+) (\\w+)' AS FixedString(11)));

SELECT extractGroups('abc=111, def=222, ghi=333 "jkl mno"="444 foo bar"', '("[^"]+"|\\w+)=("[^"]+"|\\w+)');

SELECT
    length(haystack),
    length(matches),
    arrayMap(x -> length(x), matches)
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractGroups(haystack, '(abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz)') AS matches
        FROM numbers(3)
    );

SELECT
    length(haystack),
    length(matches),
    arrayReduce('sum', arrayMap(x -> length(x), matches))
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractGroups(haystack, '(\\w)') AS matches
        FROM numbers(3)
    );

SELECT
    length(haystack),
    length(matches),
    arrayMap(x -> length(x), matches)
FROM (
        SELECT
            repeat('abcdefghijklmnopqrstuvwxyz', number * 10) AS haystack,
            extractGroups(haystack, repeat('(\\w)', 100)) AS matches
        FROM numbers(3)
    );