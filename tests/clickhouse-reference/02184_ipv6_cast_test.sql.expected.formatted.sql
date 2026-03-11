SELECT
    ip,
    ipv6,
    cblock,
    cblock1,
    is_ipv6,
    cutIPv6(ipv6, 10, 1)
FROM ipv6_test26473;