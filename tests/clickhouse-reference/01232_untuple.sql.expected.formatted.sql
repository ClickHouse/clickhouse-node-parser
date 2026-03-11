SELECT untuple(tuple(* EXCEPT (b)))
FROM (
        SELECT
            1 AS a,
            2 AS b,
            3 AS c
    );

SELECT
    'hello',
    untuple(tuple(* EXCEPT (b))),
    'world'
FROM (
        SELECT
            1 AS a,
            2 AS b,
            3 AS c
    );

SELECT argMax(untuple(x))
FROM (
        SELECT (number, number + 1) AS x
        FROM numbers(10)
    );

SELECT
    argMax(untuple(x)),
    min(x)
FROM (
        SELECT (number, number + 1) AS x
        FROM numbers(10)
    )
HAVING tuple(untuple(min(x))).1 != 42;

SELECT
    key,
    untuple(argMax(tuple(* EXCEPT (key)), v1))
FROM kv
GROUP BY key
ORDER BY key ASC
FORMAT TSVWithNames;