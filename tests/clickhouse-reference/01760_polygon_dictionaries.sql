CREATE DATABASE 01760_db;
CREATE TABLE 01760_db.polygons (key Array(Array(Array(Tuple(Float64, Float64)))), name String, value UInt64, value_nullable Nullable(UInt64)) ENGINE = Memory;
CREATE TABLE 01760_db.points (x Float64, y Float64, def_i UInt64, def_s String) ENGINE = Memory;
CREATE DICTIONARY 01760_db.dict_array
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name String DEFAULT 'qqq',
    value UInt64 DEFAULT 10,
    value_nullable Nullable(UInt64) DEFAULT 20
)
PRIMARY KEY key
SOURCE(CLICKHOUSE(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'polygons' DB '01760_db'))
LIFETIME(0)
LAYOUT(POLYGON())
SETTINGS(dictionary_use_async_executor=1, max_threads=8)
;
SELECT tuple(x, y) as key,
    dictGet('01760_db.dict_array', 'name', key),
    dictGet('01760_db.dict_array', 'value', key),
    dictGet('01760_db.dict_array', 'value_nullable', key)
FROM 01760_db.points
ORDER BY x, y;
SELECT tuple(x, y) as key,
    dictGetOrDefault('01760_db.dict_array', 'name', key, 'DefaultName'),
    dictGetOrDefault('01760_db.dict_array', 'value', key, 30),
    dictGetOrDefault('01760_db.dict_array', 'value_nullable', key, 40)
FROM 01760_db.points
ORDER BY x, y;
SELECT tuple(x, y) as key,
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key)
FROM 01760_db.points
ORDER BY x, y;
SELECT tuple(nan, inf) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
SELECT tuple(nan, nan) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
SELECT tuple(inf, nan) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
SELECT tuple(inf, inf) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
