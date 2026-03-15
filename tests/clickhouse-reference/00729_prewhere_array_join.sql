SET send_logs_level = 'fatal';
set allow_deprecated_syntax_for_merge_tree=1;
create table t1_00729 (id UInt64, val Array(String),nid UInt64, eDate Date)ENGINE = MergeTree(eDate, (id, eDate), 8192);
select arrayJoin(val) as nameGroup6 from t1_00729 prewhere notEmpty(toString(nameGroup6)) group by nameGroup6 order by nameGroup6; -- { serverError ILLEGAL_PREWHERE }
select arrayJoin(val) as nameGroup6, countDistinct(nid) as rowids from t1_00729 where notEmpty(toString(nameGroup6)) group by nameGroup6 order by nameGroup6;
select arrayJoin(val) as nameGroup6, countDistinct(nid) as rowids from t1_00729 prewhere notEmpty(toString(nameGroup6)) group by nameGroup6 order by nameGroup6; -- { serverError ILLEGAL_PREWHERE }
create table t1_00729 (id UInt64, val Array(String),nid UInt64, eDate Date) ENGINE = MergeTree(eDate, (id, eDate), 8192);
