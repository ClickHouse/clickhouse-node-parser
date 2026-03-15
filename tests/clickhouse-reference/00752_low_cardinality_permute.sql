create table lc_perm (val UInt32, str LowCardinality(String)) engine = MergeTree order by val;
select * from lc_perm order by val;
select str from lc_perm where val < 12 order by str;
