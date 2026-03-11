SELECT tag1 AS part_name
FROM (
        SELECT
            tag1,
            sum(is_covered) AS is_covered
        FROM (
                SELECT
                    tag1,
                    tag2,
                    isMergeTreePartCoveredBy(tag1, tag2) AS is_covered
                FROM
                    mt
                ARRAY JOIN names AS tag1
                ARRAY JOIN names AS tag2
                WHERE tag1 != tag2
            )
        GROUP BY tag1
    )
WHERE is_covered = 0
ORDER BY
    tupleElement(mergeTreePartInfo(part_name), 'partition_id') ASC,
    tupleElement(mergeTreePartInfo(part_name), 'min_block') ASC;