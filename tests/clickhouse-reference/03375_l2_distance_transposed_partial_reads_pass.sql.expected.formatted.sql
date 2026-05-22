SET enable_analyzer = 1;

-- Check if [L2/cosine/...]DistanceTransposed(vec, reference_vec, N) partial reads are achieved with optimize_qbit_distance_function_reads
CREATE TABLE qbit
(
    id UInt32,
    vec QBit(BFloat16, 16)
)
ENGINE = Memory;

SET optimize_qbit_distance_function_reads = true;

SET optimize_qbit_distance_function_reads = false;

DROP TABLE qbit;

-- https://github.com/ClickHouse/ClickHouse/issues/88362
CREATE TABLE qbit
(
    id UInt32,
    vec QBit(BFloat16, 1)
)
ENGINE = Memory;

INSERT INTO qbit;

WITH [2] AS reference_vec

SELECT
    id,
    round(L2DistanceTransposed(vec, reference_vec, toNullable(1)), 5) AS dist
FROM qbit;

WITH [2] AS reference_vec

SELECT
    id,
    round(L2DistanceTransposed(vec, reference_vec, toLowCardinality(toNullable(1))), 5) AS dist
FROM qbit;