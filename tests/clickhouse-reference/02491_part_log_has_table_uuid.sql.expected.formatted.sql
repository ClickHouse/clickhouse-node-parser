-- Tags: no-ordinary-database
CREATE TABLE data_02491
(
    key Int
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS old_parts_lifetime = 600;

INSERT INTO data_02491;

DROP TABLE data_02491;