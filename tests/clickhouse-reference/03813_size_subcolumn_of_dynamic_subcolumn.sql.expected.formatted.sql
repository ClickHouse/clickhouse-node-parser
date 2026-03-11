SELECT
    ad.`Array(UInt64)`.size2,
    jd.a.:`Array(Nullable(Int64))`.size2,
    jd.`b[]`.c.:`Array(Array(Nullable(Int64)))`.size3,
    jd.`b[]`.c.:`Array(Array(Nullable(Int64)))`.size4
FROM test;

SELECT
    ad.`Array(UInt64)`.size0,
    jd.a.:`Array(Nullable(Int64))`.size0,
    jd.`b[]`.c.:`Array(Array(Nullable(Int64)))`.size0,
    jd.`b[]`.c.:`Array(Array(Nullable(Int64)))`.size1
FROM test;