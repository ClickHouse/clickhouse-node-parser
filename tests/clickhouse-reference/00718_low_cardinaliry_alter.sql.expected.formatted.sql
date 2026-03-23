SET allow_suspicious_low_cardinality_types = 1;

SYSTEM drop  table if exists tab_00718;

CREATE TABLE tab_00718
(
    a String,
    b LowCardinality(UInt32)
)
ENGINE = MergeTree
ORDER BY a;

INSERT INTO tab_00718;

SELECT
    *,
    toTypeName(b)
FROM tab_00718;