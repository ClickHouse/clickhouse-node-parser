SELECT dictGetOrDefault('flat_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT dictGetOrDefault('flat_dictionary', 'v2', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('flat_dictionary', 'v3', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_dictionary', 'v2', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_dictionary', 'v3', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_dictionary', 'v2', 1, intDiv(1, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_array_dictionary', 'v2', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_array_dictionary', 'v3', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), toUInt128(0), (materialize(toNullable(NULL)), intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT
    materialize(materialize(toLowCardinality(15))),
    dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), 0, (intDiv(materialize(NULL), id), intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT dictGetOrDefault('hashed_array_dictionary', ('v1', 'v2'), 0, (toNullable(NULL), intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT dictGetOrDefault('range_hashed_dictionary', 'val', id, toDate('2023-01-02'), intDiv(NULL, id))
FROM range_dictionary_source_table;

SELECT dictGetOrDefault('cache_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT dictGetOrDefault('cache_dictionary', 'v2', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('cache_dictionary', 'v3', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('direct_dictionary', ('v1', 'v2'), 0, (intDiv(1, id), intDiv(1, id)))
FROM dictionary_source_table;

SELECT dictGetOrDefault('direct_dictionary', 'v2', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('direct_dictionary', 'v3', id + 1, intDiv(NULL, id))
FROM dictionary_source_table;

SELECT dictGetOrDefault('ip_dictionary', 'cca2', toIPv4('202.79.32.10'), intDiv(0, id))
FROM ip_dictionary_source_table;

SELECT dictGetOrDefault('ip_dictionary', ('asn', 'cca2'), IPv6StringToNum('2a02:6b8:1::1'), (intDiv(1, id), intDiv(1, id)))
FROM ip_dictionary_source_table;

SELECT
    tuple(x, y) AS key,
    dictGetOrDefault('polygon_dictionary', 'name', key, intDiv(1, y))
FROM points;

SELECT dictGetOrDefault('regexp_dict', 'name', concat(toString(number), '/tclwebkit', toString(number)), intDiv(1, number))
FROM numbers(2);

SELECT dictGetOrDefault('regexp_dict', 'name', concat('/tclwebkit', toString(number)), intDiv(1, number))
FROM numbers(2);