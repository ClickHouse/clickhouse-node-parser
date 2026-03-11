-- Tags: stateful
select '-- check that distinct with and w/o optimization produce the same result';
select distinct * from distinct_in_order except select * from ordinary_distinct;
