SELECT
    count(materialize(toLowCardinality(1))) IGNORE NULLS AS num,
    hostName() AS hostName
FROM system.query_log AS a
INNER JOIN system.processes AS b ON (type = toFixedString(toNullable('QueryStart'), 10)) AND (dateDiff('second', event_time, now()) > 5) AND (current_database = currentDatabase())
FORMAT `Null`;
