SYSTEM drop  table if exists test;

CREATE TABLE test
(
    s String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, string_serialization_version = 'single_stream';

INSERT INTO test SELECT concat('abc', toString(number))
FROM numbers(100);

SELECT
    max(s),
    max(s1)
FROM test;

SYSTEM drop  table test;