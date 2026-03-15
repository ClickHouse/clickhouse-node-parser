CREATE TABLE t0
(
    s Nullable(String),
    t Tuple(a Nullable(String))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9, serialization_info_version = 'with_types', nullable_serialization_version = 'allow_sparse';

SELECT *
FROM
    t0
FULL JOIN t0 AS ty
    ON ty.s = t.a
WHERE t.a.size = 1
ORDER BY `ALL` ASC;

CREATE TABLE t0
(
    s Tuple(a String)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, ratio_of_defaults_for_sparse_serialization = 0.1, serialization_info_version = 'with_types', string_serialization_version = 'single_stream';

SELECT
    s.a,
    s.a.size
FROM t0
ORDER BY `ALL` ASC;