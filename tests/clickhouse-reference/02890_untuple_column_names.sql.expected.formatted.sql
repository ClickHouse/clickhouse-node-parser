SELECT '-- tuple element alias';

SELECT
    untuple(tuple(1)::Tuple(a Int)),
    untuple(tuple('s')::Tuple(a String))
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(a Int)),
    untuple(tuple('s')::Tuple(a String))
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT
    untuple(tuple(1)::Tuple(a Int)),
    untuple(tuple(1)::Tuple(a Int))
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(a Int)),
    untuple(tuple(1)::Tuple(a Int))
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT
    untuple(tuple(1)::Tuple(a Int)) AS x,
    untuple(tuple('s')::Tuple(a String)) AS y
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(a Int)) AS x,
    untuple(tuple('s')::Tuple(a String)) AS y
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT
    untuple(tuple(1)::Tuple(a Int)) AS x,
    untuple(tuple(1)::Tuple(a Int)) AS x
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(a Int)) AS x,
    untuple(tuple(1)::Tuple(a Int)) AS x
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT
    untuple(tuple(1)::Tuple(Int)) AS x,
    untuple(tuple('s')::Tuple(String)) AS y
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(Int)) AS x,
    untuple(tuple('s')::Tuple(String)) AS y
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT
    untuple(tuple(1)::Tuple(Int)) AS x,
    untuple(tuple(1)::Tuple(Int)) AS x
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(Int)) AS x,
    untuple(tuple(1)::Tuple(Int)) AS x
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT
    untuple(tuple(1)::Tuple(Int)),
    untuple(tuple('s')::Tuple(String))
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(Int)),
    untuple(tuple('s')::Tuple(String))
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT
    untuple(tuple(1)::Tuple(Int)),
    untuple(tuple(1)::Tuple(Int))
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT
    untuple(tuple(1)::Tuple(Int)),
    untuple(tuple(1)::Tuple(Int))
FORMAT Vertical
SETTINGS enable_analyzer = 1;

SELECT untuple(tuple(1 AS a)) AS t
FORMAT Vertical
SETTINGS enable_analyzer = 0, enable_named_columns_in_function_tuple = 0;

SELECT untuple(tuple(1 AS a)) AS t
FORMAT Vertical
SETTINGS enable_analyzer = 1, enable_named_columns_in_function_tuple = 0;

SELECT untuple(tuple(1 AS a)) AS t
FORMAT Vertical
SETTINGS enable_analyzer = 1, enable_named_columns_in_function_tuple = 1;

SELECT untuple(JSONExtract('{"key": "value"}', 'Tuple(key String)')) AS x
FORMAT Vertical
SETTINGS enable_analyzer = 0;

SELECT untuple(JSONExtract('{"key": "value"}', 'Tuple(key String)')) AS x
FORMAT Vertical
SETTINGS enable_analyzer = 1;