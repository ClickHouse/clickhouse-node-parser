CREATE TABLE weird_projections
(
    account_id UInt64,
    user_id String,
    PROJECTION events_by_day_proj (    SELECT
        account_id,
        countDistinct(user_id) AS total_users
    GROUP BY account_id)
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/tables/test', '1')
ORDER BY (account_id)
SETTINGS index_granularity = 8192, lightweight_mutation_projection_mode = 'rebuild';