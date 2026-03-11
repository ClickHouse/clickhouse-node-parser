SELECT variantElement(arrayJoin(mapValues(val)), 'String')
FROM test
ORDER BY `ALL` ASC;

SELECT '---';

SELECT
    key,
    arrayJoin(mapValues(val))
FROM test
ORDER BY `ALL` ASC;