CREATE TABLE t
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a;

CREATE OR REPLACE ROW POLICY rp ON t USING 0 TO ALL;

SELECT
    count(),
    min(a),
    max(a)
FROM t;