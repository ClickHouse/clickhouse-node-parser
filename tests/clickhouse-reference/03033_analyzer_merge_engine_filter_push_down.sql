set allow_suspicious_low_cardinality_types=1;
create table test (`x` LowCardinality(Nullable(UInt32)), `y` String) engine = MergeTree order by tuple();
create table m_table (x UInt32, y String) engine = Merge(currentDatabase(), 'test*');
select toTypeName(x), x FROM m_table SETTINGS additional_table_filters = {'m_table':'x != 4'}, optimize_move_to_prewhere=1, enable_analyzer=1;
