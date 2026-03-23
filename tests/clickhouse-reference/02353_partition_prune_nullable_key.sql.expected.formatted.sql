CREATE TABLE n
(
    nc Nullable(int)
)
ENGINE = MergeTree
ORDER BY (tuple())
PARTITION BY (nc)
SETTINGS allow_nullable_key = 1;

INSERT INTO n;

SELECT *
FROM n
WHERE isNull(nc);