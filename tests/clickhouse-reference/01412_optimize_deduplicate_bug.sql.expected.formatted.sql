CREATE TABLE tesd_dedupl
(
    x UInt32,
    y UInt32
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO tesd_dedupl;

SELECT *
FROM tesd_dedupl;