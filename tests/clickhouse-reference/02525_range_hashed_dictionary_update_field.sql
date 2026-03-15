CREATE TABLE test_table
(
   uid Int64,
   start Int64,
   end Int64,
   insert_time DateTime
) ENGINE = MergeTree ORDER BY (uid, start);
CREATE DICTIONARY test_dictionary
(
  start Int64,
  end Int64,
  insert_time DateTime,
  uid Int64
) PRIMARY KEY uid
LAYOUT(RANGE_HASHED())
RANGE(MIN start MAX end)
SOURCE(CLICKHOUSE(TABLE 'test_table' UPDATE_FIELD 'insert_time' UPDATE_LAG 10))
LIFETIME(MIN 1 MAX 2);
SELECT * FROM test_dictionary;
SELECT dictGet('test_dictionary', 'insert_time', toUInt64(1), 10);
SELECT sleep(3) format Null;
SELECT '--';
