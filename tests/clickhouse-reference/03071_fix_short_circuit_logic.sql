SELECT block_timestamp
FROM
(
    SELECT
        block_timestamp,
        bytes2hex(token_address) AS token_address_hex
    FROM
    (
        SELECT
            transfer_id,
            address,
            value,
            block_timestamp,
            token_address,
            'zksync' AS chain
        FROM test
    )
    WHERE (address = hex2bytes('0xd387a6e4e84a6c86bd90c158c6028a58cc8ac459')) AND (transfer_id NOT LIKE 'gas%') AND (value > 0) AND (dictGetOrDefault(token_data_map, 'is_blacklisted', (token_address_hex, 'zksync'), true))
)
SETTINGS max_threads = 1, short_circuit_function_evaluation = 'enable', enable_analyzer = 0;
