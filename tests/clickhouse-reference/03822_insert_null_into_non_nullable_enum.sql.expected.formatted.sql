CREATE TABLE t_enum_null
(
    c0 Enum('a' = 1)
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (c0);

INSERT INTO t_enum_null (c0);

SELECT *
FROM t_enum_null;