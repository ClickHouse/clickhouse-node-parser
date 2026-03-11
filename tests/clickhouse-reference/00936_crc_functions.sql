select CRC32('string');
select CrC32('string'), crc32('test'); -- We want to test, that function name is case-insensitive
select CRC32(str1) from table1 order by CRC32(str1);
select CRC32(str2) from table1 order by CRC32(str2);
select CRC32(str1), CRC32(str2) from table1 order by CRC32(str1), CRC32(str2);
select str1, str2, CRC32(str1), CRC32(str2) from table1 order by CRC32(str1), CRC32(str2);
SELECT hex(CRC32IEEE('foo'));
SELECT hex(CRC64('foo'));
