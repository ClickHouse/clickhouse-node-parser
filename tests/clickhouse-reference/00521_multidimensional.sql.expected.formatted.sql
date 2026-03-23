SYSTEM DROP  TABLE IF EXISTS multidimensional;

CREATE TABLE multidimensional
(
    x UInt64,
    arr Array(Array(String))
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO multidimensional;

SELECT *
FROM multidimensional;

INSERT INTO multidimensional (t);

SELECT *
FROM multidimensional
ORDER BY t ASC;

SYSTEM DROP  TABLE multidimensional;

CREATE TABLE multidimensional
(
    x UInt64,
    arr Array(Array(String)),
    t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))
)
ENGINE = Memory;

INSERT INTO multidimensional;

CREATE TABLE multidimensional
(
    x UInt64,
    arr Array(Array(String)),
    t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))
)
ENGINE = TinyLog;

CREATE TABLE multidimensional
(
    x UInt64,
    arr Array(Array(String)),
    t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))
)
ENGINE = StripeLog;

CREATE TABLE multidimensional
(
    x UInt64,
    arr Array(Array(String)),
    t Tuple(String, Array(Nullable(String)), Tuple(UInt32, Date))
)
ENGINE = Log;