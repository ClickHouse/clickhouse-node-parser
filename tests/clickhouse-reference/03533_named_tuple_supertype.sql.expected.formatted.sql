SELECT
    x,
    toTypeName(x)
FROM (
        SELECT arrayFilter(x -> ((x.i) > 10), [if(a.i > 0, a, b)]) AS x
        FROM named_tuples_03533_1
    );

SELECT
    x,
    toTypeName(x)
FROM (
        SELECT if(a.i > 0, a, b) AS x
        FROM named_tuples_03533_2
    );