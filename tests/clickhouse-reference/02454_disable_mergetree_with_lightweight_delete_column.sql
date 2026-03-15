create table t_row_exists(a int, _row_exists int) engine=MergeTree order by a; --{serverError ILLEGAL_COLUMN}
create table t_row_exists(a int, b int) engine=MergeTree order by a;
create table t_row_exists(a int, _row_exists int) engine=Memory;
select * from t_row_exists;
create table t_row_exists(a int, b int) engine=Memory;
