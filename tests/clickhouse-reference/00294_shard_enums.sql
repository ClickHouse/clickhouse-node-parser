select * from enums;
select * from enums ORDER BY _part;
-- ORDER BY
select * from enums order by e;
select * from enums order by e desc;
-- GROUP BY
select count(), e from enums group by e order by e;
select any(e) from enums;
-- IN
select * from enums where e in ('a', 'd');
select * from enums where e in (select e from enums);
-- DISTINCT
select distinct e from enums;
-- Comparison
select * from enums where e = e;
select * from enums where e = 'a' or e = 'd';
select * from enums where e != 'a';
select *, e < 'b' from enums;
select *, e > 'b' from enums;
-- Conversion
select toInt8(e), toInt16(e), toUInt64(e), toString(e), e from enums;
select * from enums_copy;
select * from remote('127.0.0.2', currentDatabase(), enums_copy);
