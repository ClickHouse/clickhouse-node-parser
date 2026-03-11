SELECT * * number
FROM numbers(
    exists(SELECT 1 FROM (SELECT        53, *,       materialize(toNullable(53)) FROM test AS t2 PREWHERE * OR (materialize(15) IS NOT NULL) WHERE * OR 1) LIMIT 1) = t1.i1, 5
    ) -- { serverError UNKNOWN_IDENTIFIER }
