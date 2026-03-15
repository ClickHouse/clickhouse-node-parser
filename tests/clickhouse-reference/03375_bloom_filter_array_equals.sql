create table test (x Array(String), index idx1 x type bloom_filter(0.025)) engine=MergeTree order by tuple();
select * from test where x = ['s1'];
