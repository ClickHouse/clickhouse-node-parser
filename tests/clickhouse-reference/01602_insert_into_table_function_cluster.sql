CREATE TABLE x AS system.numbers ENGINE = MergeTree ORDER BY number;
CREATE TABLE y AS system.numbers ENGINE = MergeTree ORDER BY number;
SELECT * FROM x ORDER BY number;
SELECT * FROM remote('127.0.0.{1,2}', currentDatabase(), y) ORDER BY number;
