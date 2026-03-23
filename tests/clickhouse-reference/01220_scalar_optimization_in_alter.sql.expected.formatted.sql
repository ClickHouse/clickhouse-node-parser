DROP TABLE IF EXISTS cdp_segments;

DROP TABLE IF EXISTS cdp_customers;

CREATE TABLE cdp_segments
(
    seg_id String,
    mid_seqs AggregateFunction(groupBitmap, UInt32)
)
ENGINE = ReplacingMergeTree()
ORDER BY (seg_id);

CREATE TABLE cdp_customers
(
    mid String,
    mid_seq UInt32
)
ENGINE = ReplacingMergeTree()
ORDER BY (mid_seq);

DROP TABLE cdp_segments;

DROP TABLE cdp_customers;