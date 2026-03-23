SET optimize_use_projections = 1, force_optimize_projection = 1;

SYSTEM drop  table if exists tp;

CREATE TABLE tp
(
    type Int32,
    device UUID,
    cnt UInt64
)
ENGINE = MergeTree
ORDER BY (type, device);

INSERT INTO tp SELECT
    number % 3,
    generateUUIDv4(),
    1
FROM numbers(300);

SYSTEM drop  table tp;