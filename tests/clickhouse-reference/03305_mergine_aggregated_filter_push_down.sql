

select * from (select x, sum(y) from remote('127.0.0.{1,2}', currentDatabase(), tab) group by x) where x = 42;
select * from (select x, sum(y) from remote('127.0.0.{1,2}', currentDatabase(), tab) group by grouping sets ((x, z + 1), (x, z + 2))) where x = 42;
select * from (select x, sum(y), z + 1 as q from remote('127.0.0.{1,2}', currentDatabase(), tab) group by grouping sets ((x, z + 1), (x, z + 2))) where q = 42;
