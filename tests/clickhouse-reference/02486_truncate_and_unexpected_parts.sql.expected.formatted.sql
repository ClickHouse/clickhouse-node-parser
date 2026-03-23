CREATE TABLE rmt
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/02468/{database}', '1')
ORDER BY tuple()
PARTITION BY n % 2
SETTINGS replicated_max_ratio_of_wrong_parts = 0, max_suspicious_broken_parts = 0, max_suspicious_broken_parts_bytes = 0;

CREATE TABLE rmt1
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/02468/{database}', '2')
ORDER BY tuple()
PARTITION BY n % 2
SETTINGS replicated_max_ratio_of_wrong_parts = 0, max_suspicious_broken_parts = 0, max_suspicious_broken_parts_bytes = 0;

INSERT INTO rmt SELECT *
FROM numbers(10)
SETTINGS
    max_block_size = 1,
    max_insert_threads = 1;

INSERT INTO rmt;

INSERT INTO rmt1;

SELECT
    *,
    _table
FROM merge(currentDatabase(), '')
ORDER BY
    _table ASC,
    tuple(*) ASC;

SELECT 0;

CREATE TABLE rmt2
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/02468/{database}2', '1')
ORDER BY tuple()
PARTITION BY n % 2
SETTINGS replicated_max_ratio_of_wrong_parts = 0, max_suspicious_broken_parts = 0, max_suspicious_broken_parts_bytes = 0;

CREATE TABLE rmt3
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/02468/{database}3', '1')
ORDER BY tuple()
SETTINGS replicated_max_ratio_of_wrong_parts = 0, max_suspicious_broken_parts = 0, max_suspicious_broken_parts_bytes = 0;

SET insert_keeper_fault_injection_probability = 0;

INSERT INTO rmt3;

INSERT INTO rmt3;

INSERT INTO rmt3;

SELECT *
FROM rmt3
ORDER BY n ASC;