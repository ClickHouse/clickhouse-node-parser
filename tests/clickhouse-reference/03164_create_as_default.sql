CREATE TABLE src_table
(
    time DateTime('UTC') DEFAULT fromUnixTimestamp(sipTimestamp),
    sipTimestamp UInt64
)
ENGINE = MergeTree
ORDER BY time;
INSERT INTO src_table(sipTimestamp) VALUES (toUnixTimestamp(toDateTime('2024-05-20 09:00:00', 'UTC')));
CREATE TABLE copied_table AS src_table;
SELECT name, default_expression FROM system.columns WHERE database = currentDatabase() AND table = 'src_table' ORDER BY name;
SELECT * FROM src_table ORDER BY time FORMAT JSONEachRow;
SELECT * FROM copied_table ORDER BY time FORMAT JSONEachRow;
