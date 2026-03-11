SELECT dictGetKeys(toString(number), 'u64', toUInt64(7))
FROM numbers(1);

SELECT dictGetKeys('dict_neg', toString(number), toUInt64(7))
FROM numbers(1);

SELECT dictGetKeys('dict_neg', 'no_such_attr', toUInt64(7));

SELECT dictGetKeys('dict_neg', 'u64');

SELECT dictGetKeys('dict_neg', 'u64', toUInt64(7), 1);

SELECT dictGetKeys('dict_neg', 'i32n', tuple(number))
FROM numbers(3);

SELECT dictGetKeys('non_a_dict_name', 'i32n', tuple(number))
FROM numbers(3);

SELECT dictGetKeys('dict_neg', 'not_a_attr_col', tuple(number))
FROM numbers(3);

SELECT dictGetKeys('dict_simple_kv', 'attr', toUInt32(10));

SELECT toTypeName(dictGetKeys('dict_simple_kv', 'attr', toUInt32(10)));

SELECT dictGetKeys('dict_complex2_kv', 'attr', 10);

SELECT toTypeName(dictGetKeys('dict_complex2_kv', 'attr', 10));

SELECT dictGetKeys('dict_complex1_kv', 'attr', 1);

SELECT toTypeName(dictGetKeys('dict_complex1_kv', 'attr', 1));

SELECT dictGetKeys('dict_complex_wide_kv', 'attr', 10);

SELECT toTypeName(dictGetKeys('dict_complex_wide_kv', 'attr', 10));

SELECT dictGetKeys('dict_types', 'i8', '-128');

SELECT dictGetKeys('dict_types', 'i8', '0');

SELECT dictGetKeys('dict_types', 'i8', '127');

SELECT dictGetKeys('dict_types', 'u64', '0');

SELECT dictGetKeys('dict_types', 'u64', '18446744073709551615');

SELECT dictGetKeys('dict_types', 'f32', '1.5');

SELECT dictGetKeys('dict_types', 'f32', 'inf');

SELECT dictGetKeys('dict_types', 'f32', inf);

SELECT dictGetKeys('dict_types', 'f32', '-inf');

SELECT dictGetKeys('dict_types', 'f64', '42.25');

SELECT dictGetKeys('dict_types', 'f64', 'nan');

SELECT dictGetKeys('dict_types', 'f64', nan);

SELECT dictGetKeys('dict_types', 'arr_u64', []);

SELECT dictGetKeys('dict_types', 'arr_u64', [1,2]);

SELECT dictGetKeys('dict_types', 'arr_nested', [[1,2],[3]]);

SELECT dictGetKeys('dict_types', 'arr_u64', '[]');

SELECT dictGetKeys('dict_types', 'arr_u64', '[1,2]');

SELECT dictGetKeys('dict_types', 'arr_nested', '[[1,2],[3]]');

SELECT dictGetKeys('dict_types', 'n_i32', NULL);

SELECT dictGetKeys('dict_types', 'n_i32', 0);

SELECT dictGetKeys('dict_types', 'n_str', NULL);

SELECT dictGetKeys('dict_types', 'n_str', 'x');

SELECT dictGetKeys('dict_types', 'd', '2000-01-02');

SELECT dictGetKeys('dict_types', 'dt', '2000-01-02 03:04:05');

SELECT dictGetKeys('dict_types', 'dt64', toDateTime64('1970-01-01 00:00:00', 3));

SELECT dictGetKeys('dict_types', 'uuid', '01234567-89ab-cdef-0123-456789abcdef');

SELECT dictGetKeys('dict_types', 'ip4', '1.2.3.4');

SELECT dictGetKeys('dict_types', 'ip6', '2001:db8::1');

SELECT dictGetKeys('dict_types', 's', '');

SELECT dictGetKeys('dict_types', 'dec32', '1.234');

SELECT dictGetKeys('dict_types', 'dec64', '42.500');

SELECT dictGetKeys('dict_valexpr', 's', 'alpha');

SELECT dictGetKeys('dict_valexpr', 's', v)
FROM (
        SELECT arrayJoin(['alpha','beta','zzz']) AS v
    );

SELECT dictGetKeys('dict_valexpr', 's', CAST('alpha' AS LowCardinality(String)));

SELECT dictGetKeys('dict_valexpr', 's', CAST(v AS LowCardinality(String)))
FROM (
        SELECT arrayJoin(['alpha','beta','zzz']) AS v
    );

SELECT dictGetKeys('dict_valexpr', 'i32n', CAST(NULL AS Nullable(Int32)));

SELECT dictGetKeys('dict_valexpr', 'i32n', CAST(10 AS Nullable(Int32)));

SELECT dictGetKeys('dict_valexpr', 'i32n', CAST('10' AS Nullable(String)));

SELECT dictGetKeys('dict_valexpr', 'u64', CAST(NULL AS Nullable(Int32)));

SELECT dictGetKeys('dict_valexpr', 'u64', CAST(-42 AS Nullable(Int32)));

SELECT dictGetKeys('dict_valexpr', 'u64', CAST('42' AS Nullable(String)));

SELECT dictGetKeys('dict_valexpr', 'i32n', x)
FROM (
        SELECT arrayJoin([CAST(NULL AS Nullable(Int32)), CAST(10 AS Nullable(Int32)), CAST(NULL AS Nullable(Int32)), CAST(-5 AS Nullable(Int32))]) AS x
    );

SELECT dictGetKeys('dict_valexpr', 'u64', '42');

SELECT dictGetKeys('dict_match', 'grp', 'Z');

SELECT dictGetKeys('dict_match', 'grp', v)
FROM (
        SELECT arrayJoin(['Z','Y']) AS v
    );

SELECT dictGetKeys('dict_match', 'grp', v)
FROM (
        SELECT arrayJoin(['B','C']) AS v
    );

SELECT dictGetKeys('dict_match', 'grp', 'A');

SELECT dictGetKeys('dict_match', 'grp', v)
FROM (
        SELECT arrayJoin(['A','B','A']) AS v
    );