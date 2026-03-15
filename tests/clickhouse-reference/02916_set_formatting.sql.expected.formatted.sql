SELECT formatQuerySingleLine('set additional_table_filters = {''kjsnckjn'': ''ksanmn'', ''dkm'': ''dd''}');

SELECT formatQuerySingleLine('SELECT v FROM t1 SETTINGS additional_table_filters = {''default.t1'': ''s''}');

CREATE TABLE t1
(
    v UInt64,
    s String
)
ENGINE = MergeTree()
ORDER BY v;

CREATE VIEW v1 (v UInt64)
AS
SELECT v
FROM t1
SETTINGS additional_table_filters = map('default.t1', 's != ''s1%''');