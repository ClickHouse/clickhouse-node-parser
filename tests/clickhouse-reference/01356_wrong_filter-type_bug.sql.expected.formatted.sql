SELECT
    t0.c2,
    t0.c1,
    t0.c0
FROM t0
PREWHERE t0.c0
ORDER BY
    ((t0.c2) >= (t0.c1)) ASC,
    (isNull((negate(((t0.c0) > (t0.c0)))))) ASC
FORMAT TabSeparatedWithNamesAndTypes;

SELECT
    t0.c2,
    t0.c1,
    t0.c0
FROM t0
WHERE t0.c0
ORDER BY
    ((t0.c2) >= (t0.c1)) ASC,
    (isNull((negate(((t0.c0) > (t0.c0)))))) ASC
FORMAT TabSeparatedWithNamesAndTypes
SETTINGS optimize_move_to_prewhere = 0;