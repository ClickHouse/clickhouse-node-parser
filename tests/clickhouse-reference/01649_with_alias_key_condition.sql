create table alias_key_condition ( i int, j int ) engine MergeTree order by i;
set force_primary_key = 1;
