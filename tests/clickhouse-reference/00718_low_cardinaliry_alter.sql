set allow_suspicious_low_cardinality_types = 1;
create table tab_00718 (a String, b LowCardinality(UInt32)) engine = MergeTree order by a;
select *, toTypeName(b) from tab_00718;
