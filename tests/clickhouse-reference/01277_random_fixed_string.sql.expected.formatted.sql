SELECT randomFixedString('string');

SELECT randomFixedString(0);

SELECT randomFixedString(rand() % 10);

SELECT toTypeName(randomFixedString(10));

SELECT DISTINCT c > 30000
FROM (
        SELECT
            arrayJoin(arrayMap(x -> reinterpretAsUInt8(substring(randomFixedString(100), x + 1, 1)), range(100))) AS byte,
            count() AS c
        FROM numbers(100000)
        GROUP BY byte
        ORDER BY byte ASC
    );