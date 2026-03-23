SYSTEM drop  table if exists cc sync;

CREATE TABLE cc
(
    a UInt64,
    b String
)
ENGINE = MergeTree
ORDER BY (a, b)
SETTINGS compress_marks = true;

INSERT INTO cc;

SELECT *
FROM cc;