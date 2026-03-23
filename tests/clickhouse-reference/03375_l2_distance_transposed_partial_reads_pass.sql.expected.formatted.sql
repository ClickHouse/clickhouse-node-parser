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

-- https://github.com/ClickHouse/ClickHouse/issues/88362
CREATE TABLE qbit
(
    id UInt32,
    vec QBit(BFloat16, 1)
)
ENGINE = Memory;

INSERT INTO qbit;