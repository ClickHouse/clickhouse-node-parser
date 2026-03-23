SYSTEM drop  table if exists ips_v6;

CREATE TABLE ips_v6
(
    i IPv6
)
ENGINE = Memory;

INSERT INTO ips_v6 SELECT toIPv6('::ffff:127.0.0.1');

INSERT INTO ips_v6;

INSERT INTO ips_v6;

SELECT *
FROM ips_v6;

SYSTEM drop  table ips_v6;