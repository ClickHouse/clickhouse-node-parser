-- In worst case doesn't check anything, but it's not flaky
select sleep(3) FORMAT Null;
select count() from partslost_0;
select count() from partslost_1;
select count() from partslost_2;
