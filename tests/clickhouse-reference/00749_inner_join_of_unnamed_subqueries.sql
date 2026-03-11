SELECT
    APIKey,
    ConversionEventValue
FROM
    left_table AS left_table
ALL INNER JOIN
    (
        SELECT *
        FROM
            (
                SELECT
                    APIKey,
                    EventValueForPostback AS ConversionEventValue
                FROM
                    right_table AS right_table
            )
            ALL INNER JOIN
            (
                SELECT
                    APIKey
                FROM
                    left_table as left_table
                GROUP BY
                    APIKey
            ) USING (APIKey)
    ) USING (APIKey);
