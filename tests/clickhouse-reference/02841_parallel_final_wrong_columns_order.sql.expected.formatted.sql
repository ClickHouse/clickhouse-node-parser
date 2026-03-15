CREATE TABLE tab2
(
    id String,
    version Int64,
    l String,
    accountCode String,
    z Int32
)
ENGINE = ReplacingMergeTree(z)
ORDER BY (accountCode, id, version, l)
PRIMARY KEY (accountCode, id);

SET max_threads = 2;

SELECT count()
FROM tab2 FINAL;