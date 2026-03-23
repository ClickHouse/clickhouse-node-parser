CREATE TABLE join_any_inner
(
    s String,
    x Array(UInt8),
    k UInt64
)
ENGINE = Join(`ANY`, `INNER`, k);

CREATE TABLE join_any_left
(
    s String,
    x Array(UInt8),
    k UInt64
)
ENGINE = Join(`ANY`, `LEFT`, k);

CREATE TABLE join_all_inner
(
    s String,
    x Array(UInt8),
    k UInt64
)
ENGINE = Join(`ALL`, `INNER`, k);

CREATE TABLE join_all_left
(
    s String,
    x Array(UInt8),
    k UInt64
)
ENGINE = Join(`ALL`, `LEFT`, k);

INSERT INTO join_any_inner;

INSERT INTO join_any_left;

INSERT INTO join_all_inner;

INSERT INTO join_all_left;

-- read from StorageJoin
SELECT '--------read--------';

SELECT *
FROM join_any_inner
ORDER BY k ASC;

SELECT *
FROM join_any_left
ORDER BY k ASC;

SELECT *
FROM join_all_inner
ORDER BY k ASC;

SELECT *
FROM join_all_left
ORDER BY k ASC;

-- create StorageJoin tables with customized settings
CREATE TABLE join_any_left_null
(
    s String,
    k UInt64
)
ENGINE = Join(`ANY`, `LEFT`, k)
SETTINGS join_use_nulls = 1;

INSERT INTO join_any_left_null;

SELECT joinGet('join_any_left', 's', number)
FROM numbers(3);

SELECT joinGet('join_any_left_null', 's', number)
FROM numbers(3);

-- Using identifier as the first argument
SELECT joinGet(join_any_left, 's', number)
FROM numbers(3);

SELECT joinGet(join_any_left_null, 's', number)
FROM numbers(3);

CREATE TABLE join_string_key
(
    s String,
    x Array(UInt8),
    k UInt64
)
ENGINE = Join(`ANY`, `LEFT`, s);

INSERT INTO join_string_key;

SELECT
    joinGet('join_string_key', 'x', 'abc'),
    joinGet('join_string_key', 'k', 'abc');

USE default;

CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.join_test
(
    a UInt8,
    b UInt8
)
ENGINE = Join(`ANY`, `LEFT`, a);

USE {CLICKHOUSE_DATABASE:Identifier};

SELECT joinGet('join_test', 'b', 1);

USE system;

SELECT joinGet(concat({CLICKHOUSE_DATABASE:String}, '.join_test'), 'b', 1);