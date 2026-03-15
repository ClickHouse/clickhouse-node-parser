CREATE TABLE tab2
(
    id String,
    version Int64,
    l String,
    accountCode String,
    z Int32
)
ENGINE = ReplacingMergeTree(z)
PRIMARY KEY (accountCode, id)
ORDER BY (accountCode, id, version, l);

SET max_threads = 2;

SELECT count()
FROM tab2 FINAL;