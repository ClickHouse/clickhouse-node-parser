SELECT json.a
FROM
    test
ARRAY JOIN json.b
WHERE has(json.a, 2);