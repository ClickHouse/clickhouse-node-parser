drop temporary table if exists test_00670;
create temporary table test_00670(id int);
insert into test_00670 values(0);
select * from test_00670;
drop temporary table test_00670;
