select * from tab l, tab r where l.x < r.x and r.x < 2;
select sum(x), sum(r.x) from (select * from tab l, tab r where r.x < 2 and l.x < 3);
