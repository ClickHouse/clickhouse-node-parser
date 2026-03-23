-- Tags: no-random-merge-tree-settings, no-random-settings

create table tab (x UInt64, y UInt64) engine = MergeTree order by x;
insert into tab select number, number from numbers(1e6);
insert into tab select number, number from numbers(1e6, 1e6);
select _part, min(x), max(x) from tab group by _part order by _part ;
select x from tab where bitAnd(y, 1023) == 0 order by x limit 10 settings read_in_order_use_virtual_row=1, log_processors_profiles=1, optimize_move_to_prewhere=0, max_threads=2;
