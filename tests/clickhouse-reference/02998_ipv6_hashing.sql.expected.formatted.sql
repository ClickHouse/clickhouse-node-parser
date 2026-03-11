SELECT
    toIPv6(materialize(toLowCardinality('fe80::62:5aff:fed1:daf0'))) AS ipv6,
    SHA256(ipv6)
FROM numbers(10);

SELECT
    toIPv6(materialize('fe80::62:5aff:fed1:daf0')) AS ipv6,
    SHA256(ipv6)
FROM numbers(10);