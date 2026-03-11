select '-----------String------------';
select str, max(i) from test group by str order by str nulls first;
