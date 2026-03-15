set allow_deprecated_syntax_for_merge_tree=1;
create table t_00575(d Date) engine MergeTree(d, d, 8192);
select count() from t_00575 where toDayOfWeek(d) in (2);
