SELECT initializeAggregation('uniqStateMap', map(1, 2));

SELECT initializeAggregation('uniqStateForEach', [1, 2]);

SELECT initializeAggregation('uniqStateForEachMapForEach', [map(1, [2])]);