-- { echo }
select count() from (select * from test union distinct select * from test);
select count() from (select * from test union distinct select * from test union all select * from test);
select count() from (select * from test union distinct select * from test except select * from test where name = '3');
select count() from (select * from test intersect (select * from test where toUInt8(name) < 4) union distinct (select * from test where name = '5' or name = '1') except select * from test where name = '3');
select uuid from test union distinct select uuid from test;
select uuid from test union distinct select uuid from test union all select uuid from test where name = '1';
select uuid from (select * from test union distinct select * from test);
