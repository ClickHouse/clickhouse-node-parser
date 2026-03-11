SELECT
    x,
    y,
    z
FROM test_alias_inverse_order
SETTINGS enable_analyzer = 1;

SELECT
    x,
    z,
    y
FROM test_alias_inverse_order
SETTINGS enable_analyzer = 1;