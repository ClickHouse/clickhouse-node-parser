SELECT
    field1,
    field2,
    field3
FROM alias_local10;

SELECT
    field1,
    field2,
    field3
FROM alias_local10
WHERE EventDate = '2000-01-01';

SELECT
    field1,
    field2
FROM alias_local10
WHERE EventDate = '2000-01-01';

SELECT
    field1,
    field2,
    field3
FROM alias10;

SELECT
    field1,
    field2,
    field3
FROM alias10
WHERE EventDate = '2000-01-01';

SELECT
    field1,
    field2
FROM alias10
WHERE EventDate = '2000-01-01';

SELECT
    field2,
    field3
FROM alias10
WHERE EventDate = '2000-01-01';

SELECT field3
FROM alias10
WHERE EventDate = '2000-01-01';

SELECT
    field2,
    field3
FROM alias10;

SELECT field3
FROM alias10;

SELECT field1
FROM alias10
WHERE field3 = '12345';

SELECT field2
FROM alias10
WHERE field3 = '12345';

SELECT field3
FROM alias10
WHERE field3 = '12345';