CREATE TABLE big_array (x Array(UInt8)) ENGINE=TinyLog;
SET min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;
SELECT sum(y) AS s FROM remote('127.0.0.{2,3}', currentDatabase(), big_array) ARRAY JOIN x AS y;
SELECT sum(s) FROM (SELECT y AS s FROM remote('127.0.0.{2,3}', currentDatabase(), big_array) ARRAY JOIN x AS y);
