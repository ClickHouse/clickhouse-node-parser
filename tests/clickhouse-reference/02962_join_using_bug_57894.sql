SET allow_suspicious_low_cardinality_types = 1;
CREATE TABLE t (`x` UInt32, `s` LowCardinality(String)) ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE r (`x` LowCardinality(Nullable(UInt32)), `s` Nullable(String)) ENGINE = MergeTree ORDER BY tuple();
SET enable_analyzer = 0;
SELECT x FROM t FULL JOIN r USING (x) ORDER BY ALL
;
SELECT x FROM t FULL JOIN r USING (x) ORDER BY ALL
SETTINGS join_algorithm = 'partial_merge';
SELECT x FROM t FULL JOIN r USING (x) ORDER BY ALL
SETTINGS join_algorithm = 'full_sorting_merge';
SELECT '--- analyzer ---';
SET enable_analyzer = 1;
