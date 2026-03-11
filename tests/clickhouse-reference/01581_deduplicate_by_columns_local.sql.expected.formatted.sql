SELECT
    'TOTAL rows',
    count()
FROM source_data;

SELECT *
FROM full_duplicates;

SELECT count()
FROM partial_duplicates;

SELECT *
FROM partial_duplicates;