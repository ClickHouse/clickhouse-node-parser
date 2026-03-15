create view testv(a UInt32) as select number a from numbers(10);
select groupArray(a) from testv;
create view testv(a String) as select number a from numbers(10);
