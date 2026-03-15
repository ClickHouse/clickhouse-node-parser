CREATE TABLE test_alter_on_mutation
(
  date Date,
  key UInt64,
  value String
)
ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_01062/alter_on_mutation', '1')
ORDER BY key PARTITION BY date;
SELECT sum(cast(value as UInt64)) from test_alter_on_mutation;
SELECT sum(value) from test_alter_on_mutation;
SELECT sum(value1) from test_alter_on_mutation;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE nested_alter (`d` Date, `k` UInt64, `i32` Int32, `dt` DateTime, `n.ui8` Array(UInt8), `n.s` Array(String), `n.d` Array(Date), `s` String DEFAULT '0') ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_01062/nested_alter', 'r2', d, k, 8192);
SELECT * FROM nested_alter;
