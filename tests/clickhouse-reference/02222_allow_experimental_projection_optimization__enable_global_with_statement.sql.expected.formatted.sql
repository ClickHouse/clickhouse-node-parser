CREATE TABLE data_02222
ENGINE = MergeTree()
ORDER BY dummy AS
SELECT *
FROM `system`.one;