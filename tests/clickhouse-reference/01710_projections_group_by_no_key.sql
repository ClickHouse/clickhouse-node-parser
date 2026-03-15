create table projection_without_key (key UInt32, PROJECTION x (SELECT sum(key) group by key % 3)) engine MergeTree order by key;
select sum(key) from projection_without_key settings optimize_use_projections = 1;
select sum(key) from projection_without_key settings optimize_use_projections = 0;
