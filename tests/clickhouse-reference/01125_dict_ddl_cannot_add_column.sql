CREATE TABLE date_table
(
  id UInt32,
  val String,
  start Date,
  end Date
) Engine = Memory();
CREATE DICTIONARY somedict
(
  id UInt32,
  val String,
  start Date,
  end Date
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'date_table' DB currentDatabase()))
LAYOUT(RANGE_HASHED())
RANGE (MIN start MAX end)
LIFETIME(MIN 300 MAX 360);
SELECT * from somedict;
-- No dictionary columns
SELECT 1 FROM somedict;
