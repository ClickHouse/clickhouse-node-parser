select
    tag1 as part_name
from (
    select
        tag1, sum(is_covered) as is_covered
    from (
        select
            tag1, tag2, isMergeTreePartCoveredBy(tag1, tag2) as is_covered
        from mt
            array join names AS tag1
            array join names AS tag2
        where tag1 != tag2
    )
    group by tag1
)
where is_covered = 0
order by mergeTreePartInfo(part_name).partition_id, mergeTreePartInfo(part_name).min_block;
