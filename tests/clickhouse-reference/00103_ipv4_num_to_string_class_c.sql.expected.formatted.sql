SELECT IPv4NumToStringClassC(toUInt32(0)) = '0.0.0.xxx';

SELECT IPv4NumToStringClassC(0x7f000001) = '127.0.0.xxx';

SELECT sum(IPv4NumToStringClassC(materialize(toUInt32(0))) = '0.0.0.xxx') = count()
FROM
    `system`.one
ARRAY JOIN range(1024) AS n;

SELECT sum(IPv4NumToStringClassC(materialize(0x7f000001)) = '127.0.0.xxx') = count()
FROM
    `system`.one
ARRAY JOIN range(1024) AS n;