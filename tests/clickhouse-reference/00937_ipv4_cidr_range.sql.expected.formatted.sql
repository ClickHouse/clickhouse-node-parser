SELECT IPv4CIDRToRange(toIPv4('192.168.5.2'), 0);

SELECT IPv4CIDRToRange(toIPv4('255.255.255.255'), 8);

SELECT IPv4CIDRToRange(toIPv4('192.168.5.2'), 32);

SELECT IPv4CIDRToRange(toIPv4('0.0.0.0'), 8);

SELECT IPv4CIDRToRange(toIPv4('255.0.0.0'), 4);

SELECT IPv4CIDRToRange(toIPv4('255.0.0.0'), toUInt8(4 + number))
FROM numbers(2);