SELECT 1
FROM (
        SELECT *
        FROM (
                EXPLAIN actions = 1
                SELECT text
                FROM tab
                WHERE hasAnyTokens(text, ['Alick'])
                SETTINGS use_skip_indexes_on_data_read = 1
            )
    )
PREWHERE (
        EXPLAIN actions = 1
        SELECT 1
        FROM tab
        PREWHERE hasAllTokens(text, ['Alick'])
    ) = '1';