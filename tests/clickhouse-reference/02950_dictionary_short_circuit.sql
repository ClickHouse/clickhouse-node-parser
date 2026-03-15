CREATE TABLE dictionary_source_table
(
    id UInt64,
    v1 String,
    v2 Nullable(String),
    v3 Nullable(UInt64)
) ENGINE=TinyLog;
CREATE DICTIONARY flat_dictionary
(
    id UInt64,
    v1 String,
    v2 Nullable(String) DEFAULT NULL,
    v3 Nullable(UInt64)
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'dictionary_source_table'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(FLAT());
SELECT dictGetOrDefault('flat_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;
SELECT dictGetOrDefault('flat_dictionary', 'v2', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
SELECT dictGetOrDefault('flat_dictionary', 'v3', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
CREATE DICTIONARY hashed_dictionary
(
    id UInt64,
    v1 String,
    v2 Nullable(String) DEFAULT NULL,
    v3 Nullable(UInt64)
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'dictionary_source_table'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(HASHED());
SELECT dictGetOrDefault('hashed_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;
SELECT dictGetOrDefault('hashed_dictionary', 'v2', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
SELECT dictGetOrDefault('hashed_dictionary', 'v3', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
SELECT dictGetOrDefault('hashed_dictionary', 'v2', 1, intDiv(1, id))
FROM dictionary_source_table;
CREATE DICTIONARY hashed_array_dictionary
(
    id UInt64,
    v1 String,
    v2 Nullable(String) DEFAULT NULL,
    v3 Nullable(UInt64)
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'dictionary_source_table'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(HASHED_ARRAY());
SELECT dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;
SELECT dictGetOrDefault('hashed_array_dictionary', 'v2', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
SELECT dictGetOrDefault('hashed_array_dictionary', 'v3', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
-- Fuzzer
SELECT dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), toUInt128(0), (materialize(toNullable(NULL)), intDiv(1, id), intDiv(1, id))) FROM dictionary_source_table; -- { serverError TYPE_MISMATCH }
SELECT materialize(materialize(toLowCardinality(15))), dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), 0, (intDiv(materialize(NULL), id), intDiv(1, id), intDiv(1, id))) FROM dictionary_source_table; -- { serverError TYPE_MISMATCH }
SELECT dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), 0, (toNullable(NULL), intDiv(1, id), intDiv(1, id))) FROM dictionary_source_table; -- { serverError TYPE_MISMATCH }
CREATE TABLE range_dictionary_source_table
(
    id UInt64,
    start Date,
    end Nullable(Date),
    val Nullable(UInt64)
) ENGINE=TinyLog;
CREATE DICTIONARY range_hashed_dictionary
(
    id UInt64,
    start Date,
    end Nullable(Date),
    val Nullable(UInt64)
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'range_dictionary_source_table'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(RANGE_HASHED())
RANGE(MIN start MAX end);
SELECT dictGetOrDefault('range_hashed_dictionary', 'val', id, toDate('2023-01-02'), intDiv(NULL, id))
FROM range_dictionary_source_table;
CREATE DICTIONARY cache_dictionary
(
    id UInt64,
    v1 String,
    v2 Nullable(String) DEFAULT NULL,
    v3 Nullable(UInt64)
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'dictionary_source_table'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(CACHE(SIZE_IN_CELLS 10));
SELECT dictGetOrDefault('cache_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;
SELECT dictGetOrDefault('cache_dictionary', 'v2', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
SELECT dictGetOrDefault('cache_dictionary', 'v3', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
CREATE DICTIONARY direct_dictionary
(
    id UInt64,
    v1 String,
    v2 Nullable(String) DEFAULT NULL,
    v3 Nullable(UInt64)
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'dictionary_source_table'))
LAYOUT(DIRECT());
SELECT dictGetOrDefault('direct_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;
SELECT dictGetOrDefault('direct_dictionary', 'v2', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
SELECT dictGetOrDefault('direct_dictionary', 'v3', id+1, intDiv(NULL, id))
FROM dictionary_source_table;
CREATE TABLE ip_dictionary_source_table
(
    id UInt64,
    prefix String,
    asn UInt32,
    cca2 String
) ENGINE=TinyLog;
CREATE DICTIONARY ip_dictionary
(
    id UInt64,
    prefix String,
    asn UInt32,
    cca2 String
)
PRIMARY KEY prefix
SOURCE(CLICKHOUSE(TABLE 'ip_dictionary_source_table'))
LAYOUT(IP_TRIE)
LIFETIME(3600);
SELECT dictGetOrDefault('ip_dictionary', 'cca2', toIPv4('202.79.32.10'), intDiv(0, id))
FROM ip_dictionary_source_table;
SELECT dictGetOrDefault('ip_dictionary', ('asn', 'cca2'), IPv6StringToNum('2a02:6b8:1::1'),
(intDiv(1, id), intDiv(1, id))) FROM ip_dictionary_source_table;
CREATE TABLE polygon_dictionary_source_table
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name Nullable(String)
) ENGINE=TinyLog;
CREATE DICTIONARY polygon_dictionary
(
    key Array(Array(Array(Tuple(Float64, Float64)))),
    name Nullable(String)
)
PRIMARY KEY key
SOURCE(CLICKHOUSE(TABLE 'polygon_dictionary_source_table'))
LIFETIME(0)
LAYOUT(POLYGON());
CREATE TABLE points (x Float64, y Float64) ENGINE=TinyLog;
SELECT tuple(x, y) as key, dictGetOrDefault('polygon_dictionary', 'name', key, intDiv(1, y))
FROM points;
CREATE TABLE regexp_dictionary_source_table
(
    id UInt64,
    parent_id UInt64,
    regexp String,
    keys   Array(String),
    values Array(String),
) ENGINE=TinyLog;
create dictionary regexp_dict
(
    regexp String,
    name String,
    version Nullable(UInt64),
    comment String default 'nothing'
)
PRIMARY KEY(regexp)
SOURCE(CLICKHOUSE(TABLE 'regexp_dictionary_source_table'))
LIFETIME(0)
LAYOUT(regexp_tree);
SELECT dictGetOrDefault('regexp_dict', 'name', concat(toString(number), '/tclwebkit', toString(number)),
intDiv(1,number)) FROM numbers(2);
-- Fuzzer
SELECT dictGetOrDefault('regexp_dict', 'name', concat('/tclwebkit', toString(number)), intDiv(1, number)) FROM numbers(2); -- { serverError ILLEGAL_DIVISION }
