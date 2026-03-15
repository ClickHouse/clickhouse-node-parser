CREATE TABLE interval ( `id` String, `start` Int64, `end` Int64 ) ENGINE = MergeTree ORDER BY start;
CREATE TABLE fl_interval ( `id` String, `start` Float, `end` Float ) ENGINE = MergeTree ORDER BY start;
CREATE TABLE dt_interval ( `id` String, `start` DateTime, `end` DateTime ) ENGINE = MergeTree ORDER BY start;
CREATE TABLE date_interval ( `id` String, `start` Date, `end` Date ) ENGINE = MergeTree ORDER BY start;
SELECT id, intervalLengthSum(start, end), toTypeName(intervalLengthSum(start, end)) FROM interval GROUP BY id ORDER BY id;
SELECT id, 3.4 < intervalLengthSum(start, end) AND intervalLengthSum(start, end) < 3.6, toTypeName(intervalLengthSum(start, end)) FROM fl_interval GROUP BY id ORDER BY id;
SELECT id, intervalLengthSum(start, end), toTypeName(intervalLengthSum(start, end)) FROM dt_interval GROUP BY id ORDER BY id;
SELECT id, intervalLengthSum(start, end), toTypeName(intervalLengthSum(start, end)) FROM date_interval GROUP BY id ORDER BY id;
