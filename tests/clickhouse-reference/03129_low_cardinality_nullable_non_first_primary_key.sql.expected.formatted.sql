CREATE TABLE small
(
    dt DateTime,
    user_email LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY (dt, user_email)
SETTINGS allow_nullable_key = 1, min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0;

SELECT SUM(dt::int)
FROM small
WHERE isNull(user_email);