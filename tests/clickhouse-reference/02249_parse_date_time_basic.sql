SET date_time_output_format='iso';
CREATE TABLE t (a DateTime('UTC'), b String, c String, d String, e Int32) ENGINE = Memory;
select a, e from t order by e;
