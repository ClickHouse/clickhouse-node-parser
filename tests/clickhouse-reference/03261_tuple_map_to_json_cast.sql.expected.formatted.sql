SELECT
    map('a', number::UInt32, 'b', toDate(number), 'c', range(number), 'd', [map('e', number::UInt32)])::JSON AS json,
    JSONAllPathsWithTypes(json)
FROM numbers(5);

SELECT
    map(concat('a', number % 3), number::UInt32, concat('b', number % 3), toDate(number), concat('c', number % 3), range(number), concat('d', number % 3), [map('e' || number % 3, number::UInt32)])::JSON AS json,
    JSONAllPathsWithTypes(json)
FROM numbers(5);

SELECT
    tuple(number::UInt32 AS a, toDate(number) AS b, range(number) AS c, [tuple(number::UInt32 as e)] AS d)::JSON AS json,
    JSONAllPathsWithTypes(json)
FROM numbers(5);