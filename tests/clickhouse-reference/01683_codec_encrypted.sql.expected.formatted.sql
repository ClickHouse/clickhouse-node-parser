CREATE TABLE encryption_test
(
    i Int,
    s String CODEC(AES_128_GCM_SIV)
)
ENGINE = MergeTree
ORDER BY i;

SELECT *
FROM encryption_test;

CREATE TABLE encryption_test
(
    i Int,
    s String CODEC(AES_256_GCM_SIV)
)
ENGINE = MergeTree
ORDER BY i;