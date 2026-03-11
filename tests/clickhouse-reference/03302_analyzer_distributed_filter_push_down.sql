select * from (explain indexes=1, actions=1, distributed=1
    select * from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where x = 42
);
--- lambdas are not supported
select * from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where arraySum(arrayMap(y -> y + 1, [x])) = 42;
select * from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where arraySum(arrayMap(y -> x + y + 2, [x])) = 42;
select * from (explain indexes=1, actions=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where x = 42
);
select * from (explain indexes=1, actions=1, distributed=1
    select * from (select x, sum(y) from remote('127.0.0.{1,2}', currentDatabase(), tab0) group by x) where x = 42
);
--- IN is supported
select * from (explain indexes=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where x in (select number + 42 from numbers(1))
);
--- GLOBAL IN is replaced to temporary table

select sum(y) from (select * from remote('127.0.0.2', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select * from (explain indexes=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.2', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1))
);
select sum(y) from (select * from remote('127.0.0.1', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select * from (explain indexes=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.1', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1))
);
select sum(y) from (select * from remote('127.0.0.{2,3}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select * from (explain indexes=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.{2,3}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1))
);
select sum(y) from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select * from (explain indexes=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1))
);
select sum(y) from (select * from remote('127.0.0.{1,2,3}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1));
select * from (explain indexes=1, distributed=1
    select sum(y) from (select * from remote('127.0.0.{1,2,3}', currentDatabase(), tab0)) where x global in (select number + 42 from numbers(1))
);
select sum(x) from (select * from remote('127.0.0.{1,2,3}', currentDatabase(), tab0)) where y global in (select number + 42 from numbers(1));
select * from (explain indexes=1, distributed=1
    select sum(x) from (select * from remote('127.0.0.{1,2,3}', currentDatabase(), tab0)) where y global in (select number + 42 from numbers(1))
);
select * from (explain indexes=1, distributed=1
    select * from (select * from remote('127.0.0.{1,2}', currentDatabase(), tab1)) where (tenant,recordTimestamp) IN (
    select tenant,recordTimestamp from remote('127.0.0.{1,2}', currentDatabase(), tab1) where colAlias like '%abcd%'
));
select * from (explain indexes=1, actions=1, distributed=1
    SELECT * from test_view WHERE n=100
);
