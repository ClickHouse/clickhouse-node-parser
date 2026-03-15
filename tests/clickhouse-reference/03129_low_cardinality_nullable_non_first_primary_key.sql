CREATE TABLE small (`dt` DateTime, `user_email` LowCardinality(Nullable(String)))
ENGINE = MergeTree order by (dt, user_email) settings allow_nullable_key = 1, min_bytes_for_wide_part=0, min_rows_for_wide_part=0;
SELECT SUM(dt::int) FROM small WHERE user_email IS NULL;
