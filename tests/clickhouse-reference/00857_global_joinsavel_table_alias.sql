select t2.name from remote('127.0.0.2', currentDatabase(), 'local_table') as t1
left join {CLICKHOUSE_DATABASE:Identifier}.other_table as t2 -- FIXME: doesn't work properly on remote without explicit database prefix
on t1.oth_id = t2.id
order by t2.name;
select t2.name from other_table as t2
global right join remote('127.0.0.2', currentDatabase(), 'local_table') as t1
on t1.oth_id = t2.id
order by t2.name;
select t2.name from remote('127.0.0.2', currentDatabase(), 'local_table') as t1
global left join other_table as t2
on t1.oth_id = t2.id
order by t2.name;
select other_table.name from remote('127.0.0.2', currentDatabase(), 'local_table') as t1
global left join other_table
on t1.oth_id = other_table.id
order by other_table.name;
select other_table.name from remote('127.0.0.2', currentDatabase(), 'local_table') as t1
global left join other_table as t2
on t1.oth_id = other_table.id
order by other_table.name;
