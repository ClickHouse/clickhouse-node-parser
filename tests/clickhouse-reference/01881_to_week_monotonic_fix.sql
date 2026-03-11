select * From test_tbl where ship_dt >= toDate('2020-11-01') and ship_dt <= toDate('2021-05-05') order by ship_dt;
select * From test_tbl where ship_dt >= toDate('2020-01-01') and ship_dt <= toDate('2021-05-05') order by ship_dt;
