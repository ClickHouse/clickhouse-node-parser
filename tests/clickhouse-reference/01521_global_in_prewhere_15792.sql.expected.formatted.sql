SELECT count()
FROM xp_d
PREWHERE toYYYYMM(A) GLOBAL IN (
        SELECT toYYYYMM(min(A))
        FROM xp_d
    )
WHERE B > -1;