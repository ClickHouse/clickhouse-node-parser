SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data1_without_dict.orc'))
GROUP BY c
ORDER BY c ASC;

SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data1_with_dict.orc'))
GROUP BY c
ORDER BY c ASC;

SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data1_without_dict.orc'), ORC, 'c String')
GROUP BY c
ORDER BY c ASC;

SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data1_with_dict.orc'), ORC, 'c LowCardinality(String)')
GROUP BY c
ORDER BY c ASC;

SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data2_without_dict.orc'))
GROUP BY c
ORDER BY c ASC;

SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data2_with_dict.orc'))
GROUP BY c
ORDER BY c ASC;

SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data2_without_dict.orc'), ORC, 'c String')
GROUP BY c
ORDER BY c ASC;

SELECT
    c,
    count(1)
FROM file(concat(currentDatabase(), '_03241_data2_with_dict.orc'), ORC, 'c LowCardinality(String)')
GROUP BY c
ORDER BY c ASC;