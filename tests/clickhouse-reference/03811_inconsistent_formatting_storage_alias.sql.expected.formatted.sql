SELECT formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PRIMARY KEY (c0 AS a) ORDER BY c0');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PRIMARY KEY (c0 AS a) ORDER BY c0'));

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PARTITION BY (c0 AS a) ORDER BY c0');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PARTITION BY (c0 AS a) ORDER BY c0'));

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree ORDER BY c0 SAMPLE BY (c0 AS a)');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree ORDER BY c0 SAMPLE BY (c0 AS a)'));

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PARTITION BY (c0 AS p) PRIMARY KEY (c0 AS k) ORDER BY c0 SAMPLE BY (c0 AS s)');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PARTITION BY (c0 AS p) PRIMARY KEY (c0 AS k) ORDER BY c0 SAMPLE BY (c0 AS s)'));

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PRIMARY KEY (c0 + 1 AS a) ORDER BY c0');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = MergeTree PRIMARY KEY (c0 + 1 AS a) ORDER BY c0'));