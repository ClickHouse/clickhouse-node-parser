create table x (dt String) engine MergeTree partition by toYYYYMM(toDate(dt)) order by tuple();
select * from x where dt like '2022-10-01%';
