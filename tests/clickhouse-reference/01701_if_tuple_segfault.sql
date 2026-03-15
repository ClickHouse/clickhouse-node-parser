SET use_variant_as_common_type = 0;
CREATE TABLE IF NOT EXISTS agg_table
(
    time DateTime CODEC(DoubleDelta, LZ4),
    xxx String,
    two_values Tuple(Array(UInt16), UInt32),
    agg_simple SimpleAggregateFunction(sum, UInt64),
    agg SimpleAggregateFunction(sumMap, Tuple(Array(Int16), Array(UInt64)))
)
ENGINE = AggregatingMergeTree()
ORDER BY (xxx, time);
SELECT * FROM agg_table;
SELECT if(xxx = 'x', ([2], 3), ([3], 4)) FROM agg_table;
SELECT if(xxx = 'x', ([2], 3), ([3], 4, 'q', 'w', 7)) FROM agg_table; --{ serverError NO_COMMON_TYPE }
