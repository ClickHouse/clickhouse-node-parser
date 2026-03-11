select str, str in ('a', 'd') from lc_00688;
select val, val in (1, 3) from lc_00688;
select str, str in (select arrayJoin(['a', 'd'])) from lc_00688;
select val, val in (select arrayJoin([1, 3])) from lc_00688;
select str, str in (select str from lc_00688) from lc_00688;
select val, val in (select val from lc_00688) from lc_00688;
SELECT v FROM ary_lc_null WHERE v IN (SELECT v FROM ary_lc_null);
