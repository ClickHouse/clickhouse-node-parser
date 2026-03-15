CREATE TABLE test_empty_array
(
    id UInt64,
    `a.size0` UInt64,
    a Array(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_empty_array
WHERE empty(a)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_empty_array
WHERE empty(a)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_notempty_array
(
    id UInt64,
    `a.size0` UInt64,
    a Array(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_notempty_array
WHERE notEmpty(a)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_notempty_array
WHERE notEmpty(a)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_length_array
(
    id UInt64,
    `a.size0` UInt64,
    a Array(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT
    id,
    length(a)
FROM test_length_array
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT
    id,
    length(a)
FROM test_length_array
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_empty_string
(
    id UInt64,
    `s.size` UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_empty_string
WHERE empty(s)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_empty_string
WHERE empty(s)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_notempty_string
(
    id UInt64,
    `s.size` UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_notempty_string
WHERE notEmpty(s)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_notempty_string
WHERE notEmpty(s)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_length_string
(
    id UInt64,
    `s.size` UInt64,
    s String
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT
    id,
    length(s)
FROM test_length_string
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT
    id,
    length(s)
FROM test_length_string
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_empty_map
(
    id UInt64,
    `m.size0` UInt64,
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_empty_map
WHERE empty(m)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_empty_map
WHERE empty(m)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_notempty_map
(
    id UInt64,
    `m.size0` UInt64,
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_notempty_map
WHERE notEmpty(m)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_notempty_map
WHERE notEmpty(m)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_length_map
(
    id UInt64,
    `m.size0` UInt64,
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT
    id,
    length(m)
FROM test_length_map
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT
    id,
    length(m)
FROM test_length_map
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_mapkeys
(
    id UInt64,
    `m.keys` Array(String),
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

CREATE TABLE test_mapvalues
(
    id UInt64,
    `m.values` Array(UInt64),
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

CREATE TABLE test_mapcontainskey
(
    id UInt64,
    `m.keys` Array(String),
    m Map(String, UInt64)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

CREATE TABLE test_isnull
(
    id UInt64,
    `n.null` UInt8,
    n Nullable(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_isnull
WHERE isNull(n)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_isnull
WHERE isNull(n)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_isnotnull
(
    id UInt64,
    `n.null` UInt8,
    n Nullable(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT id
FROM test_isnotnull
WHERE isNotNull(n)
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT id
FROM test_isnotnull
WHERE isNotNull(n)
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_count_nullable
(
    id UInt64,
    `n.null` UInt8,
    n Nullable(UInt64)
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echo }
SELECT count(n)
FROM test_count_nullable
SETTINGS optimize_functions_to_subcolumns = 1;

SELECT count(n)
FROM test_count_nullable
SETTINGS optimize_functions_to_subcolumns = 0;

CREATE TABLE test_tupleelement
(
    id UInt64,
    `t.a` UInt64,
    t Tuple(a UInt64, b String)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }