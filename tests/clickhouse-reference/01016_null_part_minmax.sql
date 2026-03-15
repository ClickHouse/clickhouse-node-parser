create table if not exists null_01016 (x Nullable(String)) engine MergeTree order by ifNull(x, 'order-null') partition by ifNull(x, 'partition-null');
