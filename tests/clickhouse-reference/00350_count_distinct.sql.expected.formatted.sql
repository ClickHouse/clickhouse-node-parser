SET count_distinct_implementation = 'uniq';

SELECT countDistinct(x)
FROM (
        SELECT number % 123 AS x
        FROM `system`.numbers
        LIMIT 1000
    );

SELECT countDistinct(x, y)
FROM (
        SELECT
            number % 11 AS x,
            number % 13 AS y
        FROM `system`.numbers
        LIMIT 1000
    );

SET count_distinct_implementation = 'uniqCombined';

SET count_distinct_implementation = 'uniqExact';