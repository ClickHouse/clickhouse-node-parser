SELECT *
FROM test_enum_string_functions
WHERE like(e, '%abc%');

SELECT *
FROM test_enum_string_functions
WHERE notLike(e, '%abc%');

SELECT *
FROM test_enum_string_functions
WHERE ilike(e, '%a%');

SELECT position(e, 'a')
FROM test_enum_string_functions;

SELECT match(e, 'a')
FROM test_enum_string_functions;

SELECT locate('a', e)
FROM test_enum_string_functions;

SELECT countSubstrings(e, 'a')
FROM test_enum_string_functions;

SELECT countSubstringsCaseInsensitive(e, 'a')
FROM test_enum_string_functions;

SELECT countSubstringsCaseInsensitiveUTF8(e, 'a')
FROM test_enum_string_functions;

SELECT hasToken(e, 'a')
FROM test_enum_string_functions;

SELECT hasTokenOrNull(e, 'a')
FROM test_enum_string_functions;

SELECT simpleJSONHas(json, 'foo') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONHas(json, 'a') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractUInt(json, 'a') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractUInt(json, 'not exsits') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractInt(json, 'a') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractInt(json, 'not exsits') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractFloat(json, 'a') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractFloat(json, 'not exsits') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractBool(json, 'a') AS res
FROM jsons
ORDER BY res ASC;

SELECT simpleJSONExtractBool(json, 'not exsits') AS res
FROM jsons
ORDER BY res ASC;

SELECT positionUTF8(json, 'a') AS res
FROM jsons
ORDER BY res ASC;

SELECT positionCaseInsensitiveUTF8(json, 'A') AS res
FROM jsons
ORDER BY res ASC;

SELECT positionCaseInsensitive(json, 'A') AS res
FROM jsons
ORDER BY res ASC;

SELECT like(materialize(CAST('a', 'Enum(''a'' = 1)')), randomString(0))
FROM numbers(10);

SELECT like(CAST('a', 'Enum(''a'' = 1)'), randomString(0)); -- {serverError ILLEGAL_COLUMN}

SELECT like(materialize(CAST('a', 'Enum16(''a'' = 1)')), randomString(0))
FROM numbers(10);

SELECT like(CAST('a', 'Enum16(''a'' = 1)'), randomString(0)); -- {serverError ILLEGAL_COLUMN}

SELECT like(CAST('a', 'Enum(''a'' = 1)'), 'a');

SELECT like(materialize(CAST('a', 'Enum(''a'' = 1)')), 'a')
FROM numbers(10);