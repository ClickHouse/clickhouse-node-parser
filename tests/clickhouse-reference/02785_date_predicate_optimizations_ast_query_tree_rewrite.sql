CREATE TABLE date_t (id UInt32, value1 String, date1 Date) ENGINE ReplacingMergeTree() ORDER BY id;
CREATE TABLE datetime_t (id UInt32, value1 String, date1 Datetime) ENGINE ReplacingMergeTree() ORDER BY id;
CREATE TABLE date32_t (id UInt32, value1 String, date1 Date32) ENGINE ReplacingMergeTree() ORDER BY id;
CREATE TABLE datetime64_t (id UInt32, value1 String, date1 Datetime64) ENGINE ReplacingMergeTree() ORDER BY id;
