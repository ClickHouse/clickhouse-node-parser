CREATE TABLE t_ttl_non_deterministic(A Int64)
ENGINE = MergeTree ORDER BY A TTL now() + toIntervalMonth(1); -- {serverError BAD_ARGUMENTS}
CREATE TABLE t_ttl_non_deterministic(A Int64)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/ttl1', '1') ORDER BY A TTL now() + toIntervalMonth(1); -- {serverError BAD_ARGUMENTS}
CREATE TABLE t_ttl_non_deterministic(A Int64) ENGINE = MergeTree ORDER BY A;
CREATE TABLE t_ttl_non_deterministic(A Int64) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/ttl2', '1') ORDER BY A;
CREATE TABLE t_ttl_non_deterministic(A Int64, B Int64 TTL now() + toIntervalMonth(1))
ENGINE = MergeTree ORDER BY A; -- {serverError BAD_ARGUMENTS}
CREATE TABLE t_ttl_non_deterministic(A Int64, B Int64 TTL now() + toIntervalMonth(1))
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/ttl3', '1') ORDER BY A; -- {serverError BAD_ARGUMENTS}
CREATE TABLE t_ttl_non_deterministic(A Int64, B Int64) ENGINE = MergeTree ORDER BY A;
CREATE TABLE t_ttl_non_deterministic(A Int64, B Int64) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/ttl4', '1') ORDER BY A;
