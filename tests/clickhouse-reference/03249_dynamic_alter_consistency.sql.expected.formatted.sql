-- Random settings limits: index_granularity=(100, None)
SET allow_experimental_dynamic_type = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    d Dynamic
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;

INSERT INTO test SELECT if(number < 600000, number::Dynamic, (concat('str_', number))::Dynamic)
FROM numbers(1000000);

SELECT
    count(),
    dynamicType(d),
    isDynamicElementInSharedData(d)
FROM test
GROUP BY
    dynamicType(d),
    isDynamicElementInSharedData(d)
ORDER BY count() ASC;

SYSTEM drop  table test;