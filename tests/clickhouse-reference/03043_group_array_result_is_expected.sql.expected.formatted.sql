-- https://github.com/ClickHouse/ClickHouse/issues/27115
SET enable_analyzer = 1;

CREATE TABLE fill_ex
(
    eventDate Date,
    storeId String
)
ENGINE = ReplacingMergeTree()
ORDER BY (storeId, eventDate)
PARTITION BY toYYYYMM(eventDate);

SELECT
    groupArray(key) AS keys,
    count() AS c
FROM (
        SELECT
            *,
            eventDate AS key
        FROM (
                SELECT eventDate
                FROM (
                        SELECT eventDate
                        FROM fill_ex FINAL
                        WHERE eventDate >= toDate('2021-07-01')
                            AND eventDate < toDate('2021-07-30')
                        ORDER BY eventDate ASC
                    )
                ORDER BY eventDate ASC WITH FILL FROM toDate('2021-07-01') TO toDate('2021-07-30')
            )
        ORDER BY eventDate ASC
    );