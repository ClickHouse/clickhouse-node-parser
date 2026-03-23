SET allow_experimental_dynamic_type = 1;

SET input_format_json_infer_array_of_dynamic_from_array_of_different_types = 0;

SELECT
    d,
    dynamicType(d)
FROM format(JSONEachRow, 'd Dynamic', '
{"d" : 42}
{"d" : 42.42}
{"d" : "str"}
{"d" : [1, 2, 3]}
{"d" : "2020-01-01"}
{"d" : "2020-01-01 10:00:00"}
{"d" : {"a" : 42, "b" : "str"}}
{"d" : {"a" : 43}}
{"d" : {"a" : 44, "c" : [1, 2, 3]}}
{"d" : [1, "str", [1, 2, 3]]}
{"d" : null}
{"d" : true}
')
FORMAT JSONEachRow;

SELECT
    d,
    dynamicType(d),
    isDynamicElementInSharedData(d)
FROM format(JSONEachRow, 'd Dynamic(max_types=2)', '
{"d" : 42}
{"d" : 42.42}
{"d" : "str"}
{"d" : null}
{"d" : true}
')
FORMAT JSONEachRow;

SELECT
    d,
    dynamicType(d)
FROM format(CSV, 'd Dynamic', '42
42.42
"str"
"[1, 2, 3]"
"2020-01-01"
"2020-01-01 10:00:00"
"[1, ''str'', [1, 2, 3]]"
\\N
true
')
FORMAT CSV;

SELECT
    d,
    dynamicType(d)
FROM format(TSV, 'd Dynamic', '42
42.42
str
[1, 2, 3]
2020-01-01
2020-01-01 10:00:00
[1, ''str'', [1, 2, 3]]
\\N
true
')
FORMAT TSV;

SELECT
    d,
    dynamicType(d)
FROM format(Values, 'd Dynamic', '
(42)
(42.42)
(''str'')
([1, 2, 3])
(''2020-01-01'')
(''2020-01-01 10:00:00'')
(NULL)
(true)
')
FORMAT Values;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    s String
)
ENGINE = Memory;

INSERT INTO test;

SET cast_string_to_dynamic_use_inference = 1;

SELECT
    s::Dynamic AS d,
    dynamicType(d)
FROM test;

SELECT
    s::Dynamic(max_types=3) AS d,
    dynamicType(d),
    isDynamicElementInSharedData(d)
FROM test;

SYSTEM drop  table test;