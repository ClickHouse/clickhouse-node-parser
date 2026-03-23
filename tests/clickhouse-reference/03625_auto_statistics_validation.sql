-- Tags: no-fasttest

DROP TABLE IF EXISTS t_auto_statistics_validation;
CREATE TABLE t_auto_statistics_validation (x UInt64) ENGINE = MergeTree ORDER BY x SETTINGS auto_statistics_types = 'nonexisting'; -- { serverError INCORRECT_QUERY }
CREATE TABLE t_auto_statistics_validation (x UInt64) ENGINE = MergeTree ORDER BY x SETTINGS auto_statistics_types = 'minmax; countmin'; -- { serverError SYNTAX_ERROR }
CREATE TABLE t_auto_statistics_validation (x UInt64) ENGINE = MergeTree ORDER BY x SETTINGS auto_statistics_types = 'minmax, nonexisting, countmin'; -- { serverError INCORRECT_QUERY }
CREATE TABLE t_auto_statistics_validation (x UInt64) ENGINE = MergeTree ORDER BY x SETTINGS auto_statistics_types = '';
DROP TABLE t_auto_statistics_validation;
CREATE TABLE t_auto_statistics_validation (x UInt64) ENGINE = MergeTree ORDER BY x SETTINGS auto_statistics_types = 'minmax, countmin, uniq';
CREATE TABLE t_auto_statistics_validation (x UInt64) ENGINE = MergeTree ORDER BY x;
