SELECT
    id,
    avgWeighted(value1, weight),
    avgWeighted(value2, weight),
    avgWeighted(value3, weight),
    avgWeighted(value4, weight)
FROM test_table_unsigned_values GROUP BY id ORDER BY id;
SELECT
    id,
    avgWeighted(value1, weight),
    avgWeighted(value2, weight),
    avgWeighted(value3, weight),
    avgWeighted(value4, weight)
FROM test_table_signed_values GROUP BY id ORDER BY id;
SELECT id, avgWeighted(value1, weight), avgWeighted(value2, weight) FROM test_table_float_values GROUP BY id ORDER BY id;
SELECT
    id,
    avgWeighted(value1, weight),
    avgWeighted(value2, weight),
    avgWeighted(value3, weight),
    avgWeighted(value4, weight)
FROM test_table_nullable_unsigned_values GROUP BY id ORDER BY id;
SELECT
    id,
    avgWeighted(value1, weight),
    avgWeighted(value2, weight),
    avgWeighted(value3, weight),
    avgWeighted(value4, weight)
FROM test_table_nullable_signed_values GROUP BY id ORDER BY id;
SELECT id, avgWeighted(value1, weight), avgWeighted(value2, weight) FROM test_table_nullable_float_values GROUP BY id ORDER BY id;
SELECT
    id,
    avgWeighted(value1, weight),
    avgWeighted(value2, weight),
    avgWeighted(value3, weight),
    avgWeighted(value1, weight_nullable),
    avgWeighted(value2, weight_nullable),
    avgWeighted(value3, weight_nullable)
FROM test_table_null_specifics GROUP BY id ORDER BY id;
