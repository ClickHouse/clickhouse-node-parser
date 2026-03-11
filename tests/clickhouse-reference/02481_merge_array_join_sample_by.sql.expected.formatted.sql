SELECT count()
FROM
    `02481_mergetree` SAMPLE 1/2
ARRAY JOIN arr
WHERE x != 0;

SELECT count()
FROM
    `02481_merge` SAMPLE 1/2
ARRAY JOIN arr
WHERE x != 0;