SELECT d.String
FROM (
        SELECT 'str'::Dynamic AS d
    );

SELECT json.a
FROM (
        SELECT '{"a" : 42}'::JSON AS json
    );

SELECT json.a
FROM (
        SELECT '{"a" : 42}'::JSON(a UInt32) AS json
    );

SELECT json.a.:Int64
FROM (
        SELECT materialize('{"a" : 42}')::JSON AS json
    );