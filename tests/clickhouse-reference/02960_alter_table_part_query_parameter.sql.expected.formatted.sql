SYSTEM drop  table if exists data;

CREATE TABLE data
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

INSERT INTO data;

SET param_part = 'all_1_1_0';

SET param_part = 'all_2_2_0';

INSERT INTO data;

SET param_part = 'all_3_3_0';