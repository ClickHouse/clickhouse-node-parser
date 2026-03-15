SET send_logs_level = 'fatal';
CREATE TABLE mergetree_00698 (k UInt32, `n.x` Array(UInt64), `n.y` Array(UInt64)) ENGINE = MergeTree ORDER BY k;
SELECT * FROM mergetree_00698;
