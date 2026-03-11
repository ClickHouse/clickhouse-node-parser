-- Nothing is working here :(

select sum(y) as s from remote('127.0.0.{1,2}', currentDatabase(), tab) group by x order by x;
select replaceAll(trimLeft(explain), '__table1.', '') from (explain actions = 1, sorting=1, description=0 select sum(y) as s from remote('127.0.0.{1,2}', currentDatabase(), tab) group by x order by x) where explain ilike '%sort%' or explain like '%ReadFromMergeTree%' or explain like '%Aggregat%';
select sum(y) as s from remote('127.0.0.{1,2}', currentDatabase(), tab) group by x order by x desc;
select replaceAll(trimLeft(explain), '__table1.', '') from (explain actions = 1, sorting=1, description=0 select sum(y) as s from remote('127.0.0.{1,2}', currentDatabase(), tab) group by x order by x desc ) where explain ilike '%sort%' or explain like '%ReadFromMergeTree%' or explain like '%Aggregat%';
select sum(y) as s from remote('127.0.0.{1,2}', currentDatabase(), tab) group by x order by x, s;
select replaceAll(trimLeft(explain), '__table1.', '') from (explain actions = 1, sorting=1, description=0 select sum(y) as s from remote('127.0.0.{1,2}', currentDatabase(), tab) group by x order by x, s) where explain ilike '%sort%' or explain like '%ReadFromMergeTree%' or explain like '%Aggregat%';
