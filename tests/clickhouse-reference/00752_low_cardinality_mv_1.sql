create table lc_00752 (str LowCardinality(String)) engine = MergeTree order by tuple();
CREATE MATERIALIZED VIEW lc_mv_00752 ENGINE = AggregatingMergeTree() ORDER BY tuple() populate AS SELECT substring(str, 1, 1) as letter, min(length(str)) AS min_len, max(length(str)) AS max_len FROM lc_00752 GROUP BY substring(str, 1, 1);
select * from lc_mv_00752 order by letter;
