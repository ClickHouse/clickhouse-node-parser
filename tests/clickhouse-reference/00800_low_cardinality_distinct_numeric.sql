set allow_suspicious_low_cardinality_types = 1;
create table lc_00800_2 (val LowCardinality(UInt64)) engine = MergeTree order by val;
select distinct(val) from lc_00800_2 order by val;
