SELECT hex(maxDistinctState(tuple('str'::Variant(LowCardinality(String)))));

SELECT hex(maxDistinctState(tuple(''::Variant(LowCardinality(String)))));

SELECT maxDistinctMerge(state)
FROM (
        SELECT maxDistinctState(tuple('str'::Variant(LowCardinality(String)))) AS state
    );

SELECT maxDistinctMerge(state)
FROM (
        SELECT maxDistinctState(tuple(''::Variant(LowCardinality(String)))) AS state
    );