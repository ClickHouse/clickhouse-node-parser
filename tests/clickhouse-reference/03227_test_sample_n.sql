CREATE TABLE IF NOT EXISTS table_name
(
id UInt64
)
ENGINE = MergeTree()
ORDER BY cityHash64(id)
SAMPLE BY cityHash64(id);
select count() from table_name;
SELECT count() < 50 * 5 FROM (
	SELECT * FROM table_name SAMPLE 50
);
