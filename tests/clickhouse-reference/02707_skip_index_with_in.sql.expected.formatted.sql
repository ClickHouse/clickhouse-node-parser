CREATE TABLE t_skip_index_in
(
    a String,
    b String,
    c String,
    INDEX idx_c c TYPE bloom_filter GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY (a, b);

INSERT INTO t_skip_index_in;