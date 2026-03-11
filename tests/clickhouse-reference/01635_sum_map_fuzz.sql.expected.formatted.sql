SELECT finalizeAggregation(*)
FROM (
        SELECT initializeAggregation('sumMapState', [1, 2], [1, 2], [1, null])
    );

SELECT
    [NULL],
    sumMapWithOverflow(events, [NULL], [[(NULL)]], counts)
FROM sum_map_overflow;