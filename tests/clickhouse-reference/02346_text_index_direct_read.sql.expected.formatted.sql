SELECT
    'Test hasToken:',
    count()
FROM tab
WHERE hasToken(text, 'Alick');

SELECT
    'Test hasAllTokens:',
    count()
FROM tab
WHERE hasAllTokens(text, ['Alick']);

SELECT
    'Test hasAnyTokens:',
    count()
FROM tab
WHERE hasAnyTokens(text, ['Alick']);

SELECT
    'Test hasToken + length(text):',
    count()
FROM tab
WHERE hasToken(text, 'Alick')
    OR length(text) > 1;

SELECT
    'Test select text + hasAnyTokens:',
    text
FROM tab
WHERE hasAnyTokens(text, ['Alick']);

SELECT
    'Test hasToken and hasToken:',
    count()
FROM tab
WHERE hasToken(text, 'Alick')
    AND hasToken(text, 'Blick');

SELECT
    'Test hasAnyTokens or hasToken:',
    count()
FROM tab
WHERE hasAnyTokens(text, ['Blick'])
    OR hasToken(text, 'Alick');

SELECT
    'Test NOT hasAllTokens:',
    count()
FROM tab
WHERE NOT hasAllTokens(text, ['Blick']);

SELECT message
FROM (
        SELECT
            event_time_microseconds,
            message
        FROM `system`.text_log
        WHERE logger_name = 'optimizeDirectReadFromTextIndex'
            AND startsWith(message, 'Added:')
        ORDER BY event_time_microseconds DESC
        LIMIT 8
    )
ORDER BY event_time_microseconds ASC;

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test hasToken:',
            count()
        FROM tab
        WHERE hasToken(text, 'Alick')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column:%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test hasAllTokens:',
            count()
        FROM tab
        WHERE hasAllTokens(text, ['Alick'])
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column:%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test hasAnyTokens:',
            count()
        FROM tab
        WHERE hasAnyTokens(text, ['Alick'])
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column:%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test hasToken + length(text):',
            count()
        FROM tab
        WHERE hasToken(text, 'Alick')
            OR length(text) > 1
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column:%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test select text + hasAnyTokens:',
            text
        FROM tab
        WHERE hasAnyTokens(text, ['Alick'])
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Prewhere filter column:%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test hasToken and hasToken:',
            count()
        FROM tab
        WHERE hasToken(text, 'Alick')
            AND hasToken(text, 'Blick')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Prewhere filter column:%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test hasAnyTokens or hasToken:',
            count()
        FROM tab
        WHERE hasAnyTokens(text, ['Blick'])
            OR hasToken(text, 'Alick')
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column:%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            'Test NOT hasAllTokens:',
            count()
        FROM tab
        WHERE NOT hasAllTokens(text, ['Blick'])
        SETTINGS use_skip_indexes_on_data_read = 1
    )
WHERE like(`explain`, '%Filter column:%');