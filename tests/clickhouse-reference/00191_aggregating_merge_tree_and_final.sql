set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE aggregating_00191 (d Date DEFAULT '2000-01-01', k UInt64, u AggregateFunction(uniq, UInt64)) ENGINE = AggregatingMergeTree(d, k, 8192);
SELECT k, finalizeAggregation(u) FROM aggregating_00191 FINAL order by k;
SELECT k, finalizeAggregation(u) FROM aggregating_00191 order by k;
