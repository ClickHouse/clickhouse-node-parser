SELECT
    'src_table',
    count(*)
FROM src_table;

SELECT *
FROM src_table
ORDER BY `all` ASC;

SELECT
    'dst_1_0',
    count(*)
FROM dst_1_0;

SELECT *
FROM dst_1_0
ORDER BY `all` ASC;

SELECT
    'dst_1_1',
    count(*)
FROM dst_1_1;

SELECT *
FROM dst_1_1
ORDER BY `all` ASC;

SELECT
    'dst_1_2',
    count(*)
FROM dst_1_2;

SELECT *
FROM dst_1_2
ORDER BY `all` ASC;

SELECT
    'dst_2_01',
    count(*)
FROM dst_2_01;

SELECT *
FROM dst_2_01
ORDER BY `all` ASC;

SELECT
    query,
    query_kind,
    exception_code,
    read_rows,
    written_rows,
    ProfileEvents['QueriesWithSubqueries'] AS QueriesWithSubqueries,
    ProfileEvents['SelectQueriesWithSubqueries'] AS SelectQueriesWithSubqueries,
    ProfileEvents['AsyncInsertRows'] AS AsyncInsertRows,
    ProfileEvents['SelfDuplicatedAsyncInserts'] AS SelfDuplicatedAsyncInserts,
    ProfileEvents['DuplicatedAsyncInserts'] AS DuplicatedAsyncInserts
FROM `system`.query_log
WHERE has(databases, currentDatabase())
    AND has(tables, concat(currentDatabase(), '.src_table'))
    AND type != 'QueryStart'
    AND query_kind = 'AsyncInsertFlush'
ORDER BY `all` DESC
FORMAT Vertical;