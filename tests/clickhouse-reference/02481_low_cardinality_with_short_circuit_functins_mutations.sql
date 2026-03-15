create table issue_46128 (
	id Int64,
	a LowCardinality(Nullable(String)),
	b LowCardinality(Nullable(String))
) Engine = MergeTree order by id
as  select number%100, 'xxxx', 'yyyy' from numbers(10);
select * from issue_46128 where id  <= 2 order by id;
