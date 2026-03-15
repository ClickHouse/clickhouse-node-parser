CREATE TABLE t1
(
    x UInt32,
    y UInt32
)
ENGINE = TinyLog;

CREATE TABLE t2
(
    x UInt32,
    y UInt32 DEFAULT x + 1
)
ENGINE = TinyLog;

CREATE TABLE t3
(
    x UInt32,
    y UInt32 MATERIALIZED x + 1
)
ENGINE = TinyLog;

CREATE TABLE t4
(
    x UInt32,
    y UInt32 ALIAS x + 1
)
ENGINE = TinyLog;

SELECT *
FROM remote('127.0.0.2', currentDatabase(), t1)
ORDER BY x ASC;

SELECT *
FROM remote('127.0.0.2', currentDatabase(), t2)
ORDER BY x ASC;

SELECT *
FROM remote('127.0.0.2', currentDatabase(), t3)
ORDER BY x ASC;

SELECT
    x,
    y
FROM remote('127.0.0.2', currentDatabase(), t3)
ORDER BY x ASC;

SELECT *
FROM remote('127.0.0.2', currentDatabase(), t4)
ORDER BY x ASC;

SELECT
    x,
    y
FROM remote('127.0.0.2', currentDatabase(), t4)
ORDER BY x ASC;