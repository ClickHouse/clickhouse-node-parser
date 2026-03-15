SELECT '--- int, single part';
CREATE TABLE single_int (k Int64, c Nullable(Int64)) Engine=MergeTree ORDER BY k;
SELECT c FROM single_int ORDER BY ALL SETTINGS extremes=1;
CREATE TABLE multi_int (k Int64, c Nullable(Int64)) Engine=MergeTree ORDER BY k PARTITION BY k;
SELECT c FROM multi_int ORDER BY ALL SETTINGS extremes=1;
CREATE TABLE single_float (k Int64, c Float64) Engine=MergeTree ORDER BY c;
SELECT c FROM single_float ORDER BY ALL SETTINGS extremes=1;
CREATE TABLE multi_float (k Int64, c Float64) Engine=MergeTree ORDER BY k PARTITION BY k;
SELECT c FROM multi_float ORDER BY ALL SETTINGS extremes=1;
