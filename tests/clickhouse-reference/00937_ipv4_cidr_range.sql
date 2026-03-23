CREATE TABLE ipv4_range(ip IPv4, cidr UInt8) ENGINE = Memory;
INSERT INTO ipv4_range (ip, cidr) VALUES (toIPv4('192.168.5.2'), 0), (toIPv4('192.168.5.20'), 32), (toIPv4('255.255.255.255'), 16), (toIPv4('192.142.32.2'), 32), (toIPv4('192.172.5.2'), 16), (toIPv4('0.0.0.0'), 8), (toIPv4('255.0.0.0'), 4);
SELECT IPv4CIDRToRange(toIPv4('192.168.5.2'), 0);
SELECT IPv4CIDRToRange(toIPv4('255.255.255.255'), 8);
SELECT IPv4CIDRToRange(toIPv4('192.168.5.2'), 32);
SELECT IPv4CIDRToRange(toIPv4('0.0.0.0'), 8);
SELECT IPv4CIDRToRange(toIPv4('255.0.0.0'), 4);
SELECT IPv4CIDRToRange(toIPv4('255.0.0.0'), toUInt8(4 + number)) FROM numbers(2);
