create table test_graphite (key UInt32, Path String, Time DateTime('UTC'), Value Float64, Version UInt32, col UInt64)
    engine = GraphiteMergeTree('graphite_rollup') order by key settings index_granularity=10;
SET joined_subquery_requires_alias = 0;
select key, Path, Value, Version, col from test_graphite final order by key, Path, Time desc;
select key, Path, Value, Version, col from test_graphite order by key, Path, Time desc;
