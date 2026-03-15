create table cdp_segments (seg_id String, mid_seqs AggregateFunction(groupBitmap, UInt32)) engine=ReplacingMergeTree() order by (seg_id);
create table cdp_customers (mid String, mid_seq UInt32) engine=ReplacingMergeTree() order by (mid_seq);
