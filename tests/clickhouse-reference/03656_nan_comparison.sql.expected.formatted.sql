SELECT (
        SELECT count(*)
        FROM t7 AS ref_0
        WHERE ref_0.c57 <> (multiIf(1 = 1, nan, ref_0.c57))
    ) = (
        SELECT count(*)
        FROM t7 AS ref_0
        WHERE ref_0.c57 <> nan
    );