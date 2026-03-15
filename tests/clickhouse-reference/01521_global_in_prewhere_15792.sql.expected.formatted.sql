CREATE TABLE xp
(
    A Date,
    B Int64,
    S String
)
ENGINE = MergeTree
ORDER BY B
PARTITION BY toYYYYMM(A);

CREATE TABLE xp_d AS xp
ENGINE = Distributed(test_shard_localhost, currentDatabase(), xp);

SELECT count()
FROM xp_d
PREWHERE toYYYYMM(A) GLOBAL IN (
        SELECT toYYYYMM(min(A))
        FROM xp_d
    )
WHERE B > -1;