DROP TABLE IF EXISTS union;
create view union as select 1 as test union all select 2;
SELECT * FROM union ORDER BY test;
DETACH TABLE union;
ATTACH TABLE union;
DROP TABLE union;
