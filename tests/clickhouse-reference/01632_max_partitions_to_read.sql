create table p(d Date, i int, j int) engine MergeTree partition by d order by i settings max_partitions_to_read = 1;
select * from p order by i; -- { serverError TOO_MANY_PARTITIONS }
select * from p order by i settings max_partitions_to_read = 2;
select * from p order by i settings max_partitions_to_read = 0; -- unlimited
