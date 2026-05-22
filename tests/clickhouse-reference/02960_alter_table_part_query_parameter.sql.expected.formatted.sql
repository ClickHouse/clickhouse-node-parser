DROP TABLE IF EXISTS data;

CREATE TABLE data
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

INSERT INTO data;

SET param_part = 'all_1_1_0';

alter table data detach part {part:String};

alter table data attach part {part:String};

SET param_part = 'all_2_2_0';

alter table data drop detached part {part:String} settings allow_drop_detached=1;

INSERT INTO data;

SET param_part = 'all_3_3_0';

alter table data drop part {part:String};