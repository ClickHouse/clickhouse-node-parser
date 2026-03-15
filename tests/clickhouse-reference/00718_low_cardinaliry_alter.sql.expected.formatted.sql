SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE tab_00718
(
    a String,
    b LowCardinality(UInt32)
)
ENGINE = MergeTree
ORDER BY a;

SELECT
    *,
    toTypeName(b)
FROM tab_00718;