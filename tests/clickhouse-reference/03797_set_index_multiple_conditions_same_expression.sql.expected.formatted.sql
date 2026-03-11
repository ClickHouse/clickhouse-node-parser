SELECT id
FROM test_set_index_multiple_conditions
WHERE has(mapKeys(labels), 'a')
    AND has(mapKeys(labels), 'b')
ORDER BY id ASC;

SELECT id
FROM test_set_index_multiple_conditions
WHERE has(mapKeys(labels), 'a')
    OR has(mapKeys(labels), 'c')
ORDER BY id ASC;

SELECT id
FROM test_set_index_multiple_conditions
WHERE has(mapKeys(labels), 'a')
    AND has(mapKeys(labels), 'b')
    AND has(mapKeys(labels), 'c')
ORDER BY id ASC;

SELECT id
FROM test_set_index_multiple_conditions
WHERE (has(mapKeys(labels), 'a')
    AND has(mapKeys(labels), 'b'))
    OR has(mapKeys(labels), 'c')
ORDER BY id ASC;