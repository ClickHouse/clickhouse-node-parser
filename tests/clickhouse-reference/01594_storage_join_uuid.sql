CREATE TABLE IF NOT EXISTS joint
(
    id    UUID,
    value LowCardinality(String)
)
ENGINE = Join (ANY, LEFT, id);
CREATE TABLE IF NOT EXISTS t
(
    id    UUID,
    d     DateTime
)
ENGINE = MergeTree
PARTITION BY toDate(d)
ORDER BY id;
SELECT id FROM t
ANY LEFT JOIN joint ON t.id = joint.id;
