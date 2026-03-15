create table t (a UInt64, s String) engine = MergeTree order by tuple() settings add_minmax_index_for_numeric_columns = 1;
