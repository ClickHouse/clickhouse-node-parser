CREATE TABLE using1(a UInt8, b UInt8) ENGINE=Memory;
CREATE TABLE using2(a UInt8, b UInt8) ENGINE=Memory;
SELECT * FROM using1 ALL LEFT JOIN (SELECT * FROM using2) js2 USING (a, b) ORDER BY a;
create table persons (id String, name String) engine MergeTree order by id;
create table children (id String, childName String) engine MergeTree order by id;
select * from persons all inner join children using id order by id, name, childName;
select * from persons all inner join (select * from children) as j using id order by id, name, childName;
select * from (select * from persons) as s all inner join (select * from children ) as j using id order by id, name, childName;
--
set joined_subquery_requires_alias = 0;
select * from persons all inner join (select * from children) using id order by id, name, childName;
select * from (select * from persons) all inner join (select * from children) using id order by id, name, childName;
select * from (select * from persons) as s all inner join (select * from children) using id order by id, name, childName;
