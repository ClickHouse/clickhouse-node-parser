SELECT
    uniqCombined64(bitNot(x)),
    anyHeavy(bitNot(x))
FROM (
        SELECT DISTINCT concat(2, number) AS x
        FROM numbers(10)
    )
FORMAT Null;

SELECT hex(any(bitNot('foo')));