CREATE TABLE table1
(
dt Date,
id Int32,
arr Array(LowCardinality(String))
) ENGINE = MergeTree PARTITION BY toMonday(dt)
ORDER BY (dt, id) SETTINGS index_granularity = 8192;
CREATE TABLE table2
(
dt Date,
id Int32,
arr Array(LowCardinality(String))
) ENGINE = MergeTree PARTITION BY toMonday(dt)
ORDER BY (dt, id) SETTINGS index_granularity = 8192;
select dt, id, arraySort(groupArrayArray(arr))
from (
    select dt, id, arr from table1
    where dt = '2019-01-14' and id = 1
    UNION ALL
    select dt, id, arr from table2
    where dt = '2019-01-14' and id = 1
)
group by dt, id;
