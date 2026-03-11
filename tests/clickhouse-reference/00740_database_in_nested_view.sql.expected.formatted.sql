SELECT *
FROM test_view_00740;

SELECT *
FROM test_nested_view_00740;

SELECT *
FROM test_joined_view_00740;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.test_view_00740;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.test_nested_view_00740;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.test_joined_view_00740;