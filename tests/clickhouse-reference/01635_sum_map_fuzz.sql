SELECT finalizeAggregation(*) FROM (select initializeAggregation('sumMapState', [1, 2], [1, 2], [1, null]));
SELECT [NULL], sumMapWithOverflow(events, [NULL], [[(NULL)]], counts) FROM sum_map_overflow; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
