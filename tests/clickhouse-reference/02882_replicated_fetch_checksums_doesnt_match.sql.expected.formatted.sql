-- Tags: no-shared-merge-tree
DROP TABLE IF EXISTS checksums_r3;

DROP TABLE IF EXISTS checksums_r2;

DROP TABLE IF EXISTS checksums_r1;

CREATE TABLE checksums_r1
(
    column1 UInt32,
    column2 String
)
ENGINE = ReplicatedMergeTree('/tables/{database}/checksums_table', 'r1')
ORDER BY tuple();

CREATE TABLE checksums_r2
(
    column1 UInt32,
    column2 String
)
ENGINE = ReplicatedMergeTree('/tables/{database}/checksums_table', 'r2')
ORDER BY tuple();

CREATE TABLE checksums_r3
(
    column1 UInt32,
    column2 String
)
ENGINE = ReplicatedMergeTree('/tables/{database}/checksums_table', 'r3')
ORDER BY tuple();

INSERT INTO checksums_r1;

INSERT INTO checksums_r3;

SELECT count()
FROM checksums_r1;

SELECT count()
FROM checksums_r2;

SELECT count()
FROM checksums_r3;

SET max_rows_to_read = 0; -- system.text_log can be really big

SELECT *
FROM `system`.text_log
WHERE event_time >= now() - toIntervalSecond(120)
    AND level == 'Error'
    AND like(message, '%CHECKSUM_DOESNT_MATCH%')
    AND like(logger_name, (concat('%', currentDatabase(), '%checksums_r%')));