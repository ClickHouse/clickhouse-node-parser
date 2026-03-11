SELECT count(greatest(multiIf(1, 2, toNullable(NULL), 3, 4))) FROM test1_00395 WHERE toNullable(27) GROUP BY col1 ORDER BY multiIf(27, 1, multiIf(materialize(1), toLowCardinality(2), 3, 1, 4), NULL, 4) ASC NULLS LAST, col1 DESC;
SELECT '--';
SELECT multiIf(1, 2, NULL, 3, 4), count(greatest(multiIf(1, 2, NULL, toUInt256(3), 4), multiIf(1, 2, NULL, 3, 4))) FROM test1_00395 GROUP BY col1 WITH CUBE WITH TOTALS ORDER BY multiIf(27, 1, multiIf(materialize(1), toLowCardinality(2), 3, 1, 4), NULL, 4) ASC NULLS LAST;
SELECT col1 FROM test1_00395 ORDER BY multiIf(27, 1, multiIf(materialize(1), toLowCardinality(2), 3, 1, 4), NULL, 4) ASC;
