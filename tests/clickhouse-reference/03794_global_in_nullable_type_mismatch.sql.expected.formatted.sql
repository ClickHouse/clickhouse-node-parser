SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT materialize(toNullable(42)) + number
        FROM numbers(1)
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.1', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT toNullable(number)
        FROM numbers(5)
    );