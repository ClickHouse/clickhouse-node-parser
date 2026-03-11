select sum(project in ('val1', 'val2')) from test;
select sum(project in ('val1', 'val2')) from test where project in ('val1', 'val2');
select count() from test where project in ('val1', 'val2');
select project in ('val1', 'val2') from test where project in ('val1', 'val2');
