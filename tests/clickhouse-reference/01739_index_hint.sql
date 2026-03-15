create table tbl (p Int64, t Int64, f Float64) Engine=MergeTree partition by p order by t settings index_granularity=1, add_minmax_index_for_numeric_columns=0;
select * from tbl WHERE indexHint(t = 1) order by t;
select * from tbl WHERE indexHint(t in (select toInt64(number) + 2 from numbers(3))) order by t;
select * from tbl WHERE indexHint(p = 2) order by t;
select * from tbl WHERE indexHint(p in (select toInt64(number) - 2 from numbers(3))) order by t;
create table XXXX (t Int64, f Float64) Engine=MergeTree order by t settings index_granularity=128, index_granularity_bytes = '10Mi';
SELECT sum(t) FROM XXXX WHERE indexHint(t = 42);
create table XXXX (t Int64, f Float64) Engine=MergeTree order by t settings index_granularity=8192, index_granularity_bytes = '10Mi';
SELECT count() FROM XXXX WHERE indexHint(t = toDateTime(0)) SETTINGS optimize_use_implicit_projections = 1;
CREATE TABLE XXXX (p Nullable(Int64), k Decimal(76, 39)) ENGINE = MergeTree PARTITION BY toDate(p) ORDER BY k SETTINGS index_granularity = 1, allow_nullable_key = 1;
SELECT count() FROM XXXX WHERE indexHint(p = 1.) SETTINGS optimize_use_implicit_projections = 1, enable_analyzer=0;
-- TODO: optimize_use_implicit_projections ignores indexHint (with analyzer) because source columns might be aliased.
SELECT count() FROM XXXX WHERE indexHint(p = 1.) SETTINGS optimize_use_implicit_projections = 1, enable_analyzer=1;
