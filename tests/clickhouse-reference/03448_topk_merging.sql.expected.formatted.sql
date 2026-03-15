CREATE TABLE topk_test
(
    foo UInt64,
    top_items AggregateFunction(topKWeighted(100, 3, 'counts'), String, UInt64)
)
ENGINE = AggregatingMergeTree()
ORDER BY (foo);

SELECT *
FROM (
        SELECT
            foo,
            untuple(arrayJoin(topKWeightedMerge(100, 3, 'counts')(top_items))) AS `top`
        FROM topk_test
        GROUP BY foo
    )
ORDER BY
    foo ASC,
    `top`.count DESC,
    `top`.item ASC;

SELECT *
FROM (
        SELECT untuple(arrayJoin(topKWeightedMerge(100, 3, 'counts')(top_items))) AS `top`
        FROM topk_test FINAL
    )
ORDER BY
    `top`.count DESC,
    `top`.item ASC;