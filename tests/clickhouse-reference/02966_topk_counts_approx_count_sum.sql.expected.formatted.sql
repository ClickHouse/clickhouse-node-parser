SELECT topKMerge(4, 2, 'counts')(state)
FROM (
        SELECT topKState(4, 2, 'counts')(countDigits(number * number)) AS state
        FROM numbers(1000)
    );

SELECT topKMerge(4, 3, 'counts')(state)
FROM (
        SELECT topKState(4, 2, 'counts')(countDigits(number * number)) AS state
        FROM numbers(1000)
    ); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT topKMerge(4, 2)(state)
FROM (
        SELECT topKState(4, 2, 'counts')(countDigits(number * number)) AS state
        FROM numbers(1000)
    ); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT topKMerge(state)
FROM (
        SELECT topKState(4, 2, 'counts')(countDigits(number * number)) AS state
        FROM numbers(1000)
    ); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT
    length(approx_top_k(50)(number)),
    length(approx_top_k(100)(number)),
    length(approx_top_k(35)(number))
FROM numbers(200);