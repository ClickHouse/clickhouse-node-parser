create table tesd_dedupl (x UInt32, y UInt32) engine = MergeTree order by x;
select * from tesd_dedupl;
