SELECT
    CAST('127.0.0.1' AS IPv4) AS v,
    toTypeName(v);

SELECT
    CAST(toIPv4('127.0.0.1') AS String) AS v,
    toTypeName(v);

SELECT
    CAST('2001:0db8:0000:85a3:0000:0000:ac1f:8001' AS IPv6) AS v,
    toTypeName(v);

SELECT
    CAST(toIPv6('2001:0db8:0000:85a3:0000:0000:ac1f:8001') AS String) AS v,
    toTypeName(v);

SELECT
    toIPv4OrDefault('hello') AS v,
    toTypeName(v);

SELECT
    toIPv6OrDefault('hello') AS v,
    toTypeName(v);

SELECT
    CAST('hello' AS IPv4) AS v,
    toTypeName(v);

SELECT
    CAST('hello' AS IPv6) AS v,
    toTypeName(v);

SELECT
    CAST('1.1.1.1' AS IPv6) AS v,
    toTypeName(v);