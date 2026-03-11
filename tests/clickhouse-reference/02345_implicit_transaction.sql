SELECT 'no_transaction_landing', count() = 10000 FROM landing;
SELECT 'no_transaction_target', count() < 10000 FROM target;
SELECT 'after_transaction_landing', count() FROM landing;
SELECT 'after_transaction_target', count() FROM target;
SELECT 'after_implicit_txn_in_query_settings_landing', count() FROM landing;
SELECT 'after_implicit_txn_in_query_settings_target', count() FROM target;
SELECT 'after_implicit_txn_in_session_landing', count() FROM landing;
SELECT 'after_implicit_txn_in_session_target', count() FROM target;
SELECT throwIf(number == 0) FROM numbers(100); -- { serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO }
SELECT 'in_transaction', count() FROM target;
SELECT 'out_transaction', count() FROM target;
SELECT
    'implicit_True',
    count() as all,
    transaction_id = (0,0,'00000000-0000-0000-0000-000000000000') as is_empty
FROM system.query_log
WHERE
    current_database = currentDatabase() AND
    event_date >= yesterday() AND
    query LIKE '-- Verify that the transaction_id column is populated correctly%'
GROUP BY transaction_id
FORMAT JSONEachRow;
SELECT
    'implicit_False',
    count() as all,
    transaction_id = (0,0,'00000000-0000-0000-0000-000000000000') as is_empty
FROM system.query_log
WHERE
    current_database = currentDatabase() AND
    event_date >= yesterday() AND
    query LIKE '-- Verify that the transaction_id column is NOT populated without transaction%'
GROUP BY transaction_id
FORMAT JSONEachRow;
SELECT * FROM system.one;
SELECT * FROM cluster('test_cluster_interserver_secret', system, one);  -- { serverError NOT_IMPLEMENTED }
SELECT * FROM cluster('test_cluster_two_shards', system, one);  -- { serverError NOT_IMPLEMENTED }
-- there's not session in the interserver mode
SELECT * FROM cluster('test_cluster_interserver_secret', system, one) FORMAT Null;  -- { serverError INVALID_TRANSACTION }
