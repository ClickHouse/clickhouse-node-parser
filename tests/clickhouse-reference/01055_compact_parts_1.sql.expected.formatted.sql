CREATE TABLE mt_compact
(
    a Int,
    s String
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a
SETTINGS index_granularity_bytes = 0;

CREATE TABLE mt_compact_2
(
    a Int,
    s String
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a
SETTINGS min_rows_for_wide_part = 1000;

INSERT INTO mt_compact_2;

DROP TABLE mt_compact;

DROP TABLE mt_compact_2;

SET send_logs_level = 'error';

CREATE TABLE mt_compact
(
    a Int,
    s String
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a
SETTINGS index_granularity_bytes = 0, min_rows_for_wide_part = 1000;