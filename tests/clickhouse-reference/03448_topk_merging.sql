SELECT * FROM (
    SELECT
        foo,
        untuple(arrayJoin(topKWeightedMerge(100, 3, 'counts')(top_items))) AS top
    FROM topk_test
    GROUP BY foo
)
ORDER BY foo, top.count DESC, top.item;
SELECT * FROM (
    SELECT
        untuple(arrayJoin(topKWeightedMerge(100, 3, 'counts')(top_items))) AS top
    FROM topk_test FINAL
)
ORDER BY top.count DESC, top.item;
