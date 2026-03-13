-- { echo }
SELECT count(*)
FROM `03772_table_match`
WHERE NOT match(url, '^https?://clickhouse[.]com/');

SELECT count(*)
FROM `03772_table_match`
WHERE NOT match(url, '^abcd');

SELECT count(*)
FROM `03772_table_match`
WHERE match(url, '^abcd');

SELECT count(*)
FROM `03772_table_match`
WHERE match(url, '^https?://clickhouse[.]com/') = false;