create table dt_overflow(d Date, i int) engine MergeTree partition by d order by i;
select * from dt_overflow ORDER BY d;
