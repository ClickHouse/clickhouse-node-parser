CREATE TABLE summing (k String, x UInt64, e Enum('hello' = 1, 'world' = 2)) ENGINE = SummingMergeTree ORDER BY k;
SELECT k, x, e FROM summing;
