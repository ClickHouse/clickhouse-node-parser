select * from (select distinct json.b[] from test) order by all;
