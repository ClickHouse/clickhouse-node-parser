CREATE TABLE summing_table
(
    id UInt32,
    `ip4Map.value` Array(IPv4), `ip4Map.total` Array(UInt32),
    `ip6Map.value` Array(IPv6), `ip6Map.total` Array(UInt32),
    `uuidMap.value` Array(UUID), `uuidMap.total` Array(UInt32)
) ENGINE = SummingMergeTree ORDER BY id;
SELECT * FROM summing_table ORDER BY id, ip4Map.value, ip4Map.total, ip6Map.value, ip6Map.total, uuidMap.value, uuidMap.total;
