SELECT
    '{"a" : 42, "a" : {"b" : 42}}'::JSON AS json,
    json.a,
    json.a.b,
    json.`^a`;

SELECT
    '{"a" : {"b" : 42}, "a" : 42}'::JSON AS json,
    json.a,
    json.a.b,
    json.`^a`;

SELECT '{"a" : 42, "a" : {"b" : 42}, "a" : 42}'::JSON;

SELECT '{"a" : 42, "a" : {"b" : 42}, "a" : {"c" : 42}}'::JSON;