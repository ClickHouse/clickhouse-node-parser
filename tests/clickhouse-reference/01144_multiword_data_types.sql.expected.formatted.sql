SELECT toTypeName(tuple(*))
FROM multiword_types
SETTINGS enable_named_columns_in_function_tuple = 0;

SELECT toTypeName(tuple(*))
FROM unsigned_types
SETTINGS enable_named_columns_in_function_tuple = 0;

SELECT
    CAST('42' AS DOUBLE PRECISION),
    CAST(42, 'NATIONAL CHARACTER VARYING'),
    CAST(-1 AS TINYINT UNSIGNED),
    CAST(65535, ' sMaLlInT  signed ');