CREATE TABLE log_for_alter (
  id UInt64,
  Data String
) ENGINE = Log();
CREATE TABLE table_for_alter (
  id UInt64,
  Data String
) ENGINE = MergeTree() ORDER BY id SETTINGS index_granularity=4096, index_granularity_bytes = '10Mi';
INSERT INTO table_for_alter VALUES (1, '1');
INSERT INTO table_for_alter VALUES (2, '2'); -- { serverError TOO_MANY_PARTS }
SELECT COUNT() FROM table_for_alter;
CREATE TABLE table_for_reset_setting (
 id UInt64,
 Data String
) ENGINE = MergeTree() ORDER BY id SETTINGS index_granularity=4096, index_granularity_bytes = '10Mi';
INSERT INTO table_for_reset_setting VALUES (1, '1');
INSERT INTO table_for_reset_setting VALUES (2, '2');
