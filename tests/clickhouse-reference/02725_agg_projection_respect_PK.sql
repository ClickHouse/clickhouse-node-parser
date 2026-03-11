select trimLeft(*) from (EXPLAIN indexes = 1 SELECT c1, sum(c3) FROM t0 GROUP BY c1) where explain like '%ReadFromMergeTree%';
select trimLeft(*) from (EXPLAIN indexes = 1 SELECT c1, sum(c3) FROM t0 WHERE c1 = 100 GROUP BY c1) where explain like '%Granules%';
