SELECT sum(1 + ignore(*))
FROM a
WHERE indexHint(v IN (20, 40));

SELECT sum(1 + ignore(*))
FROM a
WHERE indexHint(v IN (
        SELECT 20
        UNION ALL
        SELECT 40
        UNION ALL
        SELECT 60
    ));

SELECT 1
FROM a
PREWHERE v IN (
        SELECT 1
    )
WHERE v IN (
        SELECT 2
    );

SELECT 1
FROM a
WHERE indexHint(indexHint(materialize(0)));

SELECT sum(1 + ignore(*))
FROM a
WHERE indexHint(indexHint(v IN (20, 40)));