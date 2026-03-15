CREATE TABLE tab
(
    x UInt64,
    v UInt64
)
ENGINE = ReplacingMergeTree(v)
ORDER BY (x, sipHash64(x))
SAMPLE BY sipHash64(x);

SELECT *
FROM tab FINAL SAMPLE 1/2
ORDER BY x ASC
LIMIT 5;

SELECT sipHash64(x)
FROM tab SAMPLE 1/2
ORDER BY
    x ASC,
    sipHash64(x) ASC
LIMIT 5;