SELECT
    id,
    sumIf(value1, predicate_value),
    sumIf(value2, predicate_value),
    sumIf(value3, predicate_value),
    sumIf(value4, predicate_value)
FROM test_table_unsigned_values GROUP BY id ORDER BY id;
SELECT
    id,
    sumIf(value1, predicate_value),
    sumIf(value2, predicate_value),
    sumIf(value3, predicate_value),
    sumIf(value4, predicate_value)
FROM test_table_signed_values GROUP BY id ORDER BY id;
SELECT
    id,
    sumIf(value1, predicate_value),
    sumIf(value2, predicate_value)
FROM test_table_float_values GROUP BY id ORDER BY id;
SELECT
    id,
    sumIf(value1, predicate_value),
    sumIf(value2, predicate_value),
    sumIf(value3, predicate_value),
    sumIf(value4, predicate_value)
FROM test_table_nullable_unsigned_values GROUP BY id ORDER BY id;
SELECT
    id,
    sumIf(value1, predicate_value),
    sumIf(value2, predicate_value),
    sumIf(value3, predicate_value),
    sumIf(value4, predicate_value)
FROM test_table_nullable_signed_values GROUP BY id ORDER BY id;
SELECT
    id,
    sumIf(value1, predicate_value),
    sumIf(value2, predicate_value)
FROM test_table_nullable_float_values GROUP BY id ORDER BY id;
SELECT
    id,
    sumIf(value1, predicate_value),
    sumIf(value2, predicate_value),
    sumIf(value3, predicate_value)
FROM test_table_null_specifics GROUP BY id ORDER BY id;
SELECT
    id,
    avgWeightedIf(value1, weight, predicate_value),
    avgWeightedIf(value2, weight, predicate_value),
    avgWeightedIf(value3, weight, predicate_value)
FROM test_table_null_specifics GROUP BY id ORDER BY id;
