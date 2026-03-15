SET cross_to_inner_join_rewrite = 1;

CREATE TABLE codecTest
(
    key UInt64,
    name String,
    ref_valueF64 Float64,
    ref_valueF32 Float32,
    valueF64 Float64 CODEC(Gorilla),
    valueF32 Float32 CODEC(Gorilla)
)
ENGINE = MergeTree
ORDER BY key;

SELECT
    c1.key,
    c1.name,
    c1.ref_valueF64,
    c1.valueF64,
    c1.ref_valueF64 - c1.valueF64 AS dF64,
    'prev:',
    c2.key,
    c2.ref_valueF64
FROM
    codecTest AS c1
CROSS JOIN codecTest AS c2
WHERE dF64 != 0
    AND c2.key = c1.key - 1
LIMIT 10;

SELECT
    c1.key,
    c1.name,
    c1.ref_valueF32,
    c1.valueF32,
    c1.ref_valueF32 - c1.valueF32 AS dF32,
    'prev:',
    c2.key,
    c2.ref_valueF32
FROM
    codecTest AS c1
CROSS JOIN codecTest AS c2
WHERE dF32 != 0
    AND c2.key = c1.key - 1
LIMIT 10;