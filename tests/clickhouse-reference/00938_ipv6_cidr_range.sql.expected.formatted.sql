SELECT IPv6CIDRToRange(1, 1);

SELECT IPv6CIDRToRange('1234', 1);

SELECT IPv6CIDRToRange(toFixedString('1234', 10), 1);

SELECT IPv6CIDRToRange(toFixedString('1234', 16), toUInt16(1));

SELECT
    IPv6NumToString(ip),
    cidr,
    IPv6CIDRToRange(ip, cidr)
FROM ipv6_range;

SELECT IPv6CIDRToRange(IPv6StringToNum('2001:0db8:0000:85a3:0000:0000:ac1f:8001'), 0);

SELECT IPv6CIDRToRange(IPv6StringToNum('2001:0db8:0000:85a3:0000:0000:ac1f:8001'), 128);

SELECT IPv6CIDRToRange(IPv6StringToNum('ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff'), 64);

SELECT IPv6CIDRToRange(IPv6StringToNum('0000:0000:0000:0000:0000:0000:0000:0000'), 8);

SELECT IPv6CIDRToRange(IPv6StringToNum('ffff:0000:0000:0000:0000:0000:0000:0000'), 4);

SELECT IPv6CIDRToRange(IPv6StringToNum('2001:0db8:0000:85a3:0000:0000:ac1f:8001'), 128) = IPv6CIDRToRange(IPv6StringToNum('2001:0db8:0000:85a3:0000:0000:ac1f:8001'), 200);

SELECT IPv6CIDRToRange(IPv6StringToNum('2001:0db8:0000:85a3:0000:0000:ac1f:8001'), toUInt8(128 - number))
FROM numbers(2);