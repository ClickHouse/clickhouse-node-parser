SELECT * FROM l full outer join r on l.luid = r.ruid
where  luid is null 
  and ruid is not null;
select * from (
SELECT * FROM l full outer join r on l.luid = r.ruid) 
  where  luid is null 
  and ruid is not null;
select * from (
SELECT * FROM l full outer join r on l.luid = r.ruid
limit 100000000) 
  where  luid is null 
  and ruid is not null;
