SELECT IPv6NumToString(IPv6StringToNumOrDefault(x))
FROM
    `system`.one
ARRAY JOIN ['24', '5.123.234'] AS x;

SELECT IPv4NumToString(IPv4StringToNumOrDefault(x))
FROM
    `system`.one
ARRAY JOIN ['24', '5.123.234'] AS x;

SELECT IPv4NumToString(IPv4StringToNumOrDefault('111.111111.'));