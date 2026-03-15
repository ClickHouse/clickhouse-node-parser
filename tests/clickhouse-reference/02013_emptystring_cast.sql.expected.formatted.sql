CREATE TABLE test_uint64
(
    data UInt64 DEFAULT 0
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test_float64
(
    data Float64 DEFAULT 0.0
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test_date
(
    data Date
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test_datetime
(
    data DateTime
)
ENGINE = MergeTree
ORDER BY tuple();