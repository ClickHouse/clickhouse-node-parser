SELECT * FROM using1 ALL LEFT JOIN (SELECT * FROM using2) js2 USING (a, b) ORDER BY a;
select * from persons all inner join children using id order by id, name, childName;
select * from persons all inner join (select * from children) as j using id order by id, name, childName;
select * from (select * from persons) as s all inner join (select * from children ) as j using id order by id, name, childName;
select * from persons all inner join (select * from children) using id order by id, name, childName;
select * from (select * from persons) all inner join (select * from children) using id order by id, name, childName;
select * from (select * from persons) as s all inner join (select * from children) using id order by id, name, childName;
