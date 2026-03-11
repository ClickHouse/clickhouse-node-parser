select * from tbl WHERE indexHint(t = 1) order by t;
select * from tbl WHERE indexHint(t in (select toInt64(number) + 2 from numbers(3))) order by t;
select * from tbl WHERE indexHint(p = 2) order by t;
select * from tbl WHERE indexHint(p in (select toInt64(number) - 2 from numbers(3))) order by t;
SELECT sum(t) FROM XXXX WHERE indexHint(t = 42);
SELECT count() FROM XXXX WHERE indexHint(t = toDateTime(0)) SETTINGS optimize_use_implicit_projections = 1;
SELECT count() FROM XXXX WHERE indexHint(p = 1.) SETTINGS optimize_use_implicit_projections = 1, enable_analyzer=0;
-- TODO: optimize_use_implicit_projections ignores indexHint (with analyzer) because source columns might be aliased.
SELECT count() FROM XXXX WHERE indexHint(p = 1.) SETTINGS optimize_use_implicit_projections = 1, enable_analyzer=1;
