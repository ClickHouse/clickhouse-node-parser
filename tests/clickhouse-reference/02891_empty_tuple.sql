create table x engine MergeTree order by () as select () as a, () as b;
insert into x values ((), ());
select count() from x;
select * from x order by ();
select ();
SET allow_experimental_nullable_tuple_type = 0;
create table x (i Nullable(Tuple())) engine MergeTree order by (); -- { serverError ILLEGAL_COLUMN }
SET allow_experimental_nullable_tuple_type = 1;
SET allow_experimental_nullable_tuple_type = DEFAULT;
create table x (i LowCardinality(Tuple())) engine MergeTree order by (); -- { serverError 43 }
create table x (i Tuple(), j Array(Tuple())) engine MergeTree order by ();
insert into x values ((), [(), ()]), ((), []);
select * from x order by () settings max_threads = 1;
