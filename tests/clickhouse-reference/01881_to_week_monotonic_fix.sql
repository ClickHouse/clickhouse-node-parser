create table test_tbl (vend_nm String, ship_dt Date) engine MergeTree partition by toWeek(ship_dt) order by vend_nm;
select * From test_tbl where ship_dt >= toDate('2020-11-01') and ship_dt <= toDate('2021-05-05') order by ship_dt;
select * From test_tbl where ship_dt >= toDate('2020-01-01') and ship_dt <= toDate('2021-05-05') order by ship_dt;
