create table test (number UInt64) engine=MergeTree order by number;
select '-- count';
SELECT count(), _part FROM test GROUP BY _part ORDER BY _part;
SELECT count() > 0 AND count() < 100000, _part FROM test WHERE rand(1)%2=1 GROUP BY _part ORDER BY _part;
SELECT count() > 0 AND count() < 100000, _part FROM test WHERE rand(2)%2=1 GROUP BY _part ORDER BY _part settings optimize_use_implicit_projections=0;
SELECT count() > 0 AND count() < 100000, _part FROM test WHERE rand(3)%2=1 GROUP BY _part ORDER BY _part settings optimize_trivial_count_query=0;
SELECT count() > 0 AND count() < 100000, _part FROM test WHERE rand(4)%2=1 GROUP BY _part ORDER BY _part settings optimize_trivial_count_query=0,optimize_use_implicit_projections=0;
