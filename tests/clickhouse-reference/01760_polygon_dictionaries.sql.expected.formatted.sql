-- Tags: no-parallel
SYSTEM DROP  DATABASE IF EXISTS 01760_db;

CREATE DATABASE `01760_db`;

SYSTEM DROP  TABLE IF EXISTS 01760_db.polygons;

CREATE TABLE `01760_db`.polygons
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String,
    value UInt64,
    value_nullable Nullable(UInt64)
)
ENGINE = Memory;

INSERT INTO `01760_db`.polygons;

INSERT INTO `01760_db`.polygons;

INSERT INTO `01760_db`.polygons;

INSERT INTO `01760_db`.polygons;

SYSTEM DROP  TABLE IF EXISTS 01760_db.points;

CREATE TABLE `01760_db`.points
(
    x Float64,
    y Float64,
    def_i UInt64,
    def_s String
)
ENGINE = Memory;

INSERT INTO `01760_db`.points;

INSERT INTO `01760_db`.points;

INSERT INTO `01760_db`.points;

INSERT INTO `01760_db`.points;

INSERT INTO `01760_db`.points;

SYSTEM DROP  DICTIONARY IF EXISTS 01760_db.dict_array;

CREATE DICTIONARY `01760_db`.dict_array
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String DEFAULT 'qqq',
    value UInt64 DEFAULT 10,
    value_nullable Nullable(UInt64) DEFAULT 20
)
PRIMARY KEY key
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'polygons' DB '01760_db'))
LIFETIME(0)
LAYOUT(POLYGON())
SETTINGS(dictionary_use_async_executor = 1, max_threads = 8);

SELECT
    tuple(x, y) AS key,
    dictGet('01760_db.dict_array', 'name', key),
    dictGet('01760_db.dict_array', 'value', key),
    dictGet('01760_db.dict_array', 'value_nullable', key)
FROM `01760_db`.points
ORDER BY
    x ASC,
    y ASC;

SELECT
    tuple(x, y) AS key,
    dictGetOrDefault('01760_db.dict_array', 'name', key, 'DefaultName'),
    dictGetOrDefault('01760_db.dict_array', 'value', key, 30),
    dictGetOrDefault('01760_db.dict_array', 'value_nullable', key, 40)
FROM `01760_db`.points
ORDER BY
    x ASC,
    y ASC;

SELECT
    tuple(x, y) AS key,
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key)
FROM `01760_db`.points
ORDER BY
    x ASC,
    y ASC;

SELECT
    tuple(nan, inf) AS key,
    dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}

SELECT
    tuple(nan, nan) AS key,
    dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}

SELECT
    tuple(inf, nan) AS key,
    dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}

SELECT
    tuple(inf, inf) AS key,
    dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}

SYSTEM DROP  DICTIONARY 01760_db.dict_array;

SYSTEM DROP  TABLE 01760_db.points;

SYSTEM DROP  TABLE 01760_db.polygons;

SYSTEM DROP  DATABASE 01760_db;