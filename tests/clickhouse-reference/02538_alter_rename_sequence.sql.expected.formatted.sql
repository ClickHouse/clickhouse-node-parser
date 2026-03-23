-- Tags: no-shared-merge-tree
-- Stop replication queues
DROP TABLE IF EXISTS wrong_metadata;

CREATE TABLE wrong_metadata
(
    column1 UInt64,
    column2 UInt64,
    column3 UInt64
)
ENGINE = ReplicatedMergeTree('/test/{database}/tables/wrong_metadata', '1')
ORDER BY tuple();

INSERT INTO wrong_metadata;

INSERT INTO wrong_metadata;

SELECT *
FROM wrong_metadata
ORDER BY column1 ASC;

SELECT *
FROM wrong_metadata
ORDER BY column1_renamed ASC
FORMAT JSONEachRow;

CREATE TABLE wrong_metadata_wide
(
    column1 UInt64,
    column2 UInt64,
    column3 UInt64
)
ENGINE = ReplicatedMergeTree('/test/{database}/tables/wrong_metadata_wide', '1')
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO wrong_metadata_wide;

INSERT INTO wrong_metadata_wide;

SELECT *
FROM wrong_metadata_wide
ORDER BY column1 ASC;

SELECT *
FROM wrong_metadata_wide
ORDER BY column1_renamed ASC
FORMAT JSONEachRow;

DROP TABLE IF EXISTS wrong_metadata_wide;