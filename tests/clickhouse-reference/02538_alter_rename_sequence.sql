CREATE TABLE wrong_metadata(
    column1 UInt64,
    column2 UInt64,
    column3 UInt64
)
ENGINE ReplicatedMergeTree('/test/{database}/tables/wrong_metadata', '1')
ORDER BY tuple();
SELECT * FROM wrong_metadata ORDER BY column1;
SELECT * FROM wrong_metadata ORDER BY column1_renamed FORMAT JSONEachRow;
CREATE TABLE wrong_metadata_wide(
    column1 UInt64,
    column2 UInt64,
    column3 UInt64
)
ENGINE ReplicatedMergeTree('/test/{database}/tables/wrong_metadata_wide', '1')
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;
SELECT * FROM wrong_metadata_wide ORDER by column1;
SELECT * FROM wrong_metadata_wide ORDER BY column1_renamed FORMAT JSONEachRow;
