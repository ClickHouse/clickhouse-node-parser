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

SELECT
    s::Dynamic AS d,
    dynamicType(d)
FROM test;

SELECT
    s::Dynamic(max_types=3) AS d,
    dynamicType(d),
    isDynamicElementInSharedData(d)
FROM test;