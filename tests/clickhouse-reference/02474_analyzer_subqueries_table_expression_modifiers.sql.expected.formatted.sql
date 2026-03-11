SELECT *
FROM (
        SELECT 1
    ) FINAL;

SELECT *
FROM (
        SELECT 1
    ) SAMPLE 1/2;

SELECT *
FROM (
        SELECT 1
    ) FINAL SAMPLE 1/2;

SELECT *
FROM (
        SELECT 1
        UNION ALL
        SELECT 1
    ) FINAL;

SELECT *
FROM (
        SELECT 1
        UNION ALL
        SELECT 1
    ) SAMPLE 1/2;

SELECT *
FROM (
        SELECT 1
        UNION ALL
        SELECT 1
    ) FINAL SAMPLE 1/2;