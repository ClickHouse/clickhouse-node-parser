SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(json)) AS paths_with_types
FROM test
ORDER BY paths_with_types ASC;

SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(arrayJoin(json.a.b))) AS paths_with_types
FROM test
ORDER BY paths_with_types ASC;

SELECT DISTINCT arrayJoin(JSONAllPathsWithTypes(arrayJoin(json.a.`r[]`))) AS paths_with_types
FROM test
ORDER BY paths_with_types ASC;

SELECT
    json,
    json.a.b,
    json.a.b.c,
    json.a.b.c.d.e,
    json.a.b.b.c.d_0,
    json.a.b.b.c.d_1,
    json.a.b.b.c.d_2,
    json.a.b.b.c.d_3,
    json.a.b.b.c.d_4,
    json.a.r,
    json.a.`r[]`,
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1,
    json.a.`r[]`.b.c.d_2,
    json.a.`r[]`.b.c.d_3,
    json.a.`r[]`.b.c.d_4,
    json.`^a`,
    json.a.b.`^b`.c,
    json.a.`r[]`.`^b`.c
FROM test
FORMAT Null;

SELECT
    json,
    json.a.b,
    json.a.b.c,
    json.a.b.c.d.e,
    json.a.b.b.c.d_0,
    json.a.b.b.c.d_1,
    json.a.b.b.c.d_2,
    json.a.b.b.c.d_3,
    json.a.b.b.c.d_4,
    json.a.r,
    json.a.`r[]`,
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1,
    json.a.`r[]`.b.c.d_2,
    json.a.`r[]`.b.c.d_3,
    json.a.`r[]`.b.c.d_4,
    json.`^a`,
    json.a.b.`^b`.c,
    json.a.`r[]`.`^b`.c
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT
    json.a.b,
    json.a.b.c,
    json.a.b.c.d.e,
    json.a.b.b.c.d_0,
    json.a.b.b.c.d_1,
    json.a.b.b.c.d_2,
    json.a.b.b.c.d_3,
    json.a.b.b.c.d_4,
    json.a.r,
    json.a.`r[]`,
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1,
    json.a.`r[]`.b.c.d_2,
    json.a.`r[]`.b.c.d_3,
    json.a.`r[]`.b.c.d_4,
    json.`^a`,
    json.a.b.`^b`.c,
    json.a.`r[]`.`^b`.c
FROM test
FORMAT Null;

SELECT
    json.a.b,
    json.a.b.c,
    json.a.b.c.d.e,
    json.a.b.b.c.d_0,
    json.a.b.b.c.d_1,
    json.a.b.b.c.d_2,
    json.a.b.b.c.d_3,
    json.a.b.b.c.d_4,
    json.a.r,
    json.a.`r[]`,
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1,
    json.a.`r[]`.b.c.d_2,
    json.a.`r[]`.b.c.d_3,
    json.a.`r[]`.b.c.d_4,
    json.`^a`,
    json.a.b.`^b`.c,
    json.a.`r[]`.`^b`.c
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT count()
FROM test
WHERE empty(json.a.`r[]`.c.d.e)
    AND empty(json.a.`r[]`.b.c.d_0)
    AND empty(json.a.`r[]`.b.c.d_1);

SELECT count()
FROM test
WHERE empty(json.a.`r[]`.c.d.e.:`Array(Nullable(Int64))`)
    AND empty(json.a.`r[]`.b.c.d_0.:Int64)
    AND empty(json.a.`r[]`.b.c.d_1.:Int64);

SELECT count()
FROM test
WHERE isNull(arrayJoin(json.a.`r[]`.c.d.e))
    AND isNull(arrayJoin(json.a.`r[]`.b.c.d_0))
    AND isNull(arrayJoin(json.a.`r[]`.b.c.d_1));

SELECT count()
FROM test
WHERE isNull(arrayJoin(json.a.`r[]`.c.d.e.:`Array(Nullable(Int64))`))
    AND isNull(arrayJoin(json.a.`r[]`.b.c.d_0.:Int64))
    AND isNull(arrayJoin(json.a.`r[]`.b.c.d_1.:Int64));

SELECT
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1
FROM test
FORMAT Null;

SELECT
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT
    json.a.`r[]`.c.d.e.:`Array(Nullable(Int64))`,
    json.a.`r[]`.b.c.d_0.:Int64,
    json.a.`r[]`.b.c.d_1.:Int64
FROM test
FORMAT Null;

SELECT
    json.a.`r[]`.c.d.e.:`Array(Nullable(Int64))`,
    json.a.`r[]`.b.c.d_0.:Int64,
    json.a.`r[]`.b.c.d_1.:Int64
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1
FROM test
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.c.d.e,
    json.a.`r[]`.b.c.d_0,
    json.a.`r[]`.b.c.d_1
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.c.d.e.:`Array(Nullable(Int64))`,
    json.a.`r[]`.b.c.d_0.:Int64,
    json.a.`r[]`.b.c.d_1.:Int64
FROM test
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.c.d.e.:`Array(Nullable(Int64))`,
    json.a.`r[]`.b.c.d_0.:Int64,
    json.a.`r[]`.b.c.d_1.:Int64
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT count()
FROM test
WHERE empty(json.a.`r[]`.`^b`)
    AND empty(json.a.`r[]`.`^b`.c)
    AND empty(json.a.`r[]`.b.c.d_0);

SELECT count()
FROM test
WHERE empty(json.a.`r[]`.`^b`)
    AND empty(json.a.`r[]`.`^b`.c)
    AND empty(json.a.`r[]`.b.c.d_0.:Int64);

SELECT count()
FROM test
WHERE empty(arrayJoin(json.a.`r[]`.`^b`))
    AND empty(arrayJoin(json.a.`r[]`.`^b`.c))
    AND isNull(arrayJoin(json.a.`r[]`.b.c.d_0));

SELECT count()
FROM test
WHERE empty(arrayJoin(json.a.`r[]`.`^b`))
    AND empty(arrayJoin(json.a.`r[]`.`^b`.c))
    AND isNull(arrayJoin(json.a.`r[]`.b.c.d_0.:Int64));

SELECT
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0
FROM test
FORMAT Null;

SELECT
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0.:Int64
FROM test
FORMAT Null;

SELECT
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0.:Int64
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0
FROM test
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0
FROM test
ORDER BY id ASC
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0.:Int64
FROM test
FORMAT Null;

SELECT
    json.a.r,
    json.a.`r[]`.`^b`,
    json.a.`r[]`.`^b`.c,
    json.a.`r[]`.b.c.d_0.:Int64
FROM test
ORDER BY id ASC
FORMAT Null;