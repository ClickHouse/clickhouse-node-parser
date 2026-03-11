select uniqExact(json) from test;
select count(), json from test group by json order by toString(json);
