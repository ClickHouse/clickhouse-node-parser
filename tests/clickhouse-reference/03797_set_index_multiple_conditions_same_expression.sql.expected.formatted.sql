-- This query previously failed with:
-- "Not found column mapKeys(labels) in block"
SELECT id
FROM test_set_index_multiple_conditions
WHERE has(mapKeys(labels), 'a')
    AND has(mapKeys(labels), 'b')
ORDER BY id ASC;

-- Test with OR
SELECT id
FROM test_set_index_multiple_conditions
WHERE has(mapKeys(labels), 'a')
    OR has(mapKeys(labels), 'c')
ORDER BY id ASC;

-- Test with three conditions
SELECT id
FROM test_set_index_multiple_conditions
WHERE has(mapKeys(labels), 'a')
    AND has(mapKeys(labels), 'b')
    AND has(mapKeys(labels), 'c')
ORDER BY id ASC;

-- Test with mixed AND/OR
SELECT id
FROM test_set_index_multiple_conditions
WHERE (has(mapKeys(labels), 'a')
    AND has(mapKeys(labels), 'b'))
    OR has(mapKeys(labels), 'c')
ORDER BY id ASC;