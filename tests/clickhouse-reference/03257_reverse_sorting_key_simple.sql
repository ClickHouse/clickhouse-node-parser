select * from x1 where i = 3;
select count() from x1 where i between 3 and 10;
select * from x1 order by i desc limit 5;
select * from x1 order by i limit 5;
select * from x2 where j = 1003;
select count() from x2 where i between 3 and 10 and j between 1003 and 1008;
select * from x2 order by i, j desc limit 5;
select * from x2 order by i, j limit 5;
