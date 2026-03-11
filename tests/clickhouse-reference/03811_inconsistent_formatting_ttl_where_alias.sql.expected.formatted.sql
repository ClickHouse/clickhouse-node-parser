SELECT formatQuerySingleLine('ALTER TABLE t (MODIFY TTL c0 DELETE WHERE (0.761 AS a0))');

SELECT formatQuerySingleLine(formatQuerySingleLine('ALTER TABLE t (MODIFY TTL c0 DELETE WHERE (0.761 AS a0))'));