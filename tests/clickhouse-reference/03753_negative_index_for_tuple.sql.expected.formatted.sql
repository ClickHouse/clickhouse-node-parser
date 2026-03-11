SELECT
    (1, 2).-1,
    (1, 2).-2;

SELECT tuple().-1;

SELECT (1, 2, 3).-4;

SELECT tupleElement((1, 2), negate(1e42));

SELECT tupleElement((1, 'hello'), -10, 2);

SELECT *
FROM (
        SELECT _partition_value.-1
        FROM a1
        UNION ALL
        SELECT _partition_value.-1
        FROM a2
    )
ORDER BY `all` ASC;