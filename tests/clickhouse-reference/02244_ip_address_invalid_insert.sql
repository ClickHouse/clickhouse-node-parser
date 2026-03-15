CREATE TABLE test_table_ipv4
(
    ip String,
    ipv4 IPv4
) ENGINE = TinyLog;
SET input_format_ipv4_default_on_conversion_error = 1;
SELECT ip, ipv4 FROM test_table_ipv4;
SET input_format_ipv4_default_on_conversion_error = 0;
CREATE TABLE test_table_ipv4_materialized
(
    ip String,
    ipv6 IPv4 MATERIALIZED toIPv4(ip)
) ENGINE = TinyLog;
SET cast_ipv4_ipv6_default_on_conversion_error = 1;
SELECT ip, ipv6 FROM test_table_ipv4_materialized;
SET cast_ipv4_ipv6_default_on_conversion_error = 0;
CREATE TABLE test_table_ipv6
(
    ip String,
    ipv6 IPv6
) ENGINE = TinyLog;
SET input_format_ipv6_default_on_conversion_error = 1;
SELECT ip, ipv6 FROM test_table_ipv6;
SET input_format_ipv6_default_on_conversion_error = 0;
CREATE TABLE test_table_ipv6_materialized
(
    ip String,
    ipv6 IPv6 MATERIALIZED toIPv6(ip)
) ENGINE = TinyLog;
SELECT ip, ipv6 FROM test_table_ipv6_materialized;
