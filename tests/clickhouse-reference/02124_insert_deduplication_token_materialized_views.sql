select
  (select count() from test where test='case1'),
  (select sum(c) from test_mv_a where test='case1'),
  (select sum(c) from test_mv_b where test='case1'),
  (select sum(c) from test_mv_c where test='case1');
select
  (select count() from test where test='case2'),
  (select sum(c) from test_mv_a where test='case2'),
  (select sum(c) from test_mv_b where test='case2'),
  (select sum(c) from test_mv_c where test='case2');
select
  (select count() from test where test='case3'),
  (select sum(c) from test_mv_a where test='case3'),
  (select sum(c) from test_mv_b where test='case3'),
  (select sum(c) from test_mv_c where test='case3');
select
  (select count() from test where test='case4'),
  (select sum(c) from test_mv_a where test='case4'),
  (select sum(c) from test_mv_b where test='case4'),
  (select sum(c) from test_mv_c where test='case4');
