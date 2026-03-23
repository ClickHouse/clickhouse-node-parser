CREATE TABLE src
(
    id UInt64,
    ip4 IPv4,
    ip6 IPv6
)
ENGINE = Memory AS
SELECT *
FROM VALUES((1, '1.1.1.1', '::1.1.1.1'), (2, '2.2.2.2', '::2.2.2.2'));

CREATE DICTIONARY dict
(
    id UInt64,
    ip4 IPv4,
    ip6 IPv6
)
PRIMARY KEY id
SOURCE(clickhouse(table src))
LIFETIME(10)
LAYOUT(HASHED());

SELECT dictGet('dict', ('ip6', 'ip4'), arrayJoin([2,1]));

SYSTEM DROP  DICTIONARY dict;

SYSTEM DROP  TABLE src;