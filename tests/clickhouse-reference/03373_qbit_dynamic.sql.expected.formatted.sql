SELECT
    id,
    data,
    dynamicType(data) AS type
FROM qbit_dynamic_test
ORDER BY id ASC;