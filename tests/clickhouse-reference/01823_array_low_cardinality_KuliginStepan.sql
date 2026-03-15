create temporary table test (
    arr Array(Array(LowCardinality(String)))
);
select arrayFilter(x -> 1, arr) from test;
