CREATE TABLE IF NOT EXISTS joint
(
    id UUID,
    value LowCardinality(String)
)
ENGINE = Join(`ANY`, `LEFT`, id);

CREATE TABLE IF NOT EXISTS t
(
    id UUID,
    d DateTime
)
ENGINE = MergeTree
ORDER BY id
PARTITION BY toDate(d);

SELECT id
FROM
    t
LEFT JOIN joint
    ON t.id = joint.id;