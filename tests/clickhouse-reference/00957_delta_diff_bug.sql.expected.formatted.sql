SET allow_suspicious_codecs = 1;

CREATE TABLE segfault_table
(
    id UInt16 CODEC(Delta(2))
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO segfault_table;

SELECT *
FROM segfault_table;