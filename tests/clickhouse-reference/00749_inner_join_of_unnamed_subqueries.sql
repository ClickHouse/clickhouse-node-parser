set joined_subquery_requires_alias = 0;
CREATE TABLE left_table(APIKey Int32, SomeColumn String) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE right_table(APIKey Int32, EventValueForPostback String) ENGINE = MergeTree ORDER BY tuple();
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
