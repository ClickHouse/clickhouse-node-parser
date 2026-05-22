DROP TABLE IF EXISTS data_r1;

DROP TABLE IF EXISTS data_r2;

CREATE TABLE data_r1
(
    key Int
)
ENGINE = ReplicatedMergeTree('/tables/{database}', 'r1')
ORDER BY tuple();

CREATE TABLE data_r2
ENGINE = ReplicatedMergeTree('/tables/{database}', 'r2')
ORDER BY tuple();

SHOW CREATE TABLE data_r2 FORMAT LineAsString;