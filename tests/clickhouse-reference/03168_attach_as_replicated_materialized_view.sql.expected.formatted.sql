-- Tags: zookeeper, no-replicated-database, no-ordinary-database
CREATE TABLE hourly_data
(
    domain_name String,
    event_time DateTime,
    count_views UInt64
)
ENGINE = MergeTree
ORDER BY (domain_name, event_time);

CREATE TABLE monthly_aggregated_data
(
    domain_name String,
    month Date,
    sumCountViews AggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree
ORDER BY (domain_name, month);

CREATE MATERIALIZED VIEW monthly_aggregated_data_mv
TO monthly_aggregated_data
AS
SELECT
    toDate(toStartOfMonth(event_time)) AS month,
    domain_name,
    sumState(count_views) AS sumCountViews
FROM hourly_data
GROUP BY
    domain_name,
    month;

SELECT sumMerge(sumCountViews) AS sumCountViews
FROM monthly_aggregated_data_mv;

SELECT count()
FROM hourly_data;

SELECT
    name,
    engine
FROM `system`.tables
WHERE database = currentDatabase();