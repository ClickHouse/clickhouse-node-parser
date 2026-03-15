set allow_deprecated_syntax_for_merge_tree=1;
create table aliases_test (date default today(), id default rand(), array default [0, 1, 2]) engine=MergeTree(date, id, 1);
select array from aliases_test;
select struct.key, struct.value from aliases_test;
select struct.key, struct.value from aliases_test array join struct;
select struct.key, struct.value from aliases_test array join struct as struct;
select class.key, class.value from aliases_test array join struct as class;
