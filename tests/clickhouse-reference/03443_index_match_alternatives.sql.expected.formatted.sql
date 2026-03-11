SELECT '-- Without index';

SELECT name
FROM `03443_data`
WHERE match(name, 'J|XYZ')
SETTINGS use_skip_indexes = 0;

SELECT name
FROM `03443_data`
WHERE match(name, 'XYZ|J')
SETTINGS use_skip_indexes = 0;

SELECT name
FROM `03443_data`
WHERE match(name, '[J]|XYZ')
SETTINGS use_skip_indexes = 0;

SELECT name
FROM `03443_data`
WHERE match(name, 'XYZ|[J]')
SETTINGS use_skip_indexes = 0;

SELECT name
FROM `03443_data`
WHERE match(name, 'J|XYZ')
SETTINGS use_skip_indexes = 1;

SELECT name
FROM `03443_data`
WHERE match(name, 'XYZ|J')
SETTINGS use_skip_indexes = 1;

SELECT name
FROM `03443_data`
WHERE match(name, '[J]|XYZ')
SETTINGS use_skip_indexes = 1;

SELECT name
FROM `03443_data`
WHERE match(name, 'XYZ|[J]')
SETTINGS use_skip_indexes = 1;

SELECT trimLeft(`explain`, ' ')
FROM (
        EXPLAIN indexes = 1
        SELECT name
        FROM `03443_data`
        WHERE match(name, 'J|XYZ')
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS use_skip_indexes = 1;

SELECT trimLeft(`explain`, ' ')
FROM (
        EXPLAIN indexes = 1
        SELECT name
        FROM `03443_data`
        WHERE match(name, 'XYZ|J')
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS use_skip_indexes = 1;

SELECT trimLeft(`explain`, ' ')
FROM (
        EXPLAIN indexes = 1
        SELECT name
        FROM `03443_data`
        WHERE match(name, '[J]|XYZ')
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS use_skip_indexes = 1;

SELECT trimLeft(`explain`, ' ')
FROM (
        EXPLAIN indexes = 1
        SELECT name
        FROM `03443_data`
        WHERE match(name, 'XYZ|[J]')
    )
WHERE like(`explain`, '%Granules: %')
SETTINGS use_skip_indexes = 1;