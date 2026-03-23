CREATE TABLE t0
(
    c0 JSON
)
ENGINE = MergeTree()
ORDER BY (c0); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

INSERT INTO t0 (c0); -- { serverError UNKNOWN_TABLE }

SELECT '---';

CREATE TABLE t1
(
    c0 JSON
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (c0); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }

INSERT INTO t1 (c0); -- { serverError UNKNOWN_TABLE }

SELECT c0
FROM t1
ORDER BY c0 ASC; -- { serverError UNKNOWN_TABLE }