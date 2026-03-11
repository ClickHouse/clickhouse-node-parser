SELECT
    '{"a" : 42, "a.b" : 43}'::JSON(a UInt32, `a.b` UInt32) AS json,
    json.a,
    json.a.b;