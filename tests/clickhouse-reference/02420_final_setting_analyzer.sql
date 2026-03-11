-- expected output is 2 because final is turned off
select count() from replacing_mt;
-- expected output is 4 because select_final == 0
select count() from lhs inner join rhs on lhs.x = rhs.x;
-- expected output is 2, it should silently ignore final modifier
select count() from regular_mt_table;
select count() from nv_regular_mt_table;
-- expected output
-- 1 c a c
-- 1 c b c
select left_table.id,val_left, val_middle, val_right from left_table
                                                              inner join middle_table on left_table.id = middle_table.id
                                                              inner join right_table on middle_table.id = right_table.id
ORDER BY left_table.id, val_left, val_middle, val_right;
-- extra: same with subquery
select left_table.id,val_left, val_middle, val_right from left_table
                                                              inner join middle_table on left_table.id = middle_table.id
                                                              inner join (SELECT * FROM right_table WHERE id = 1) r on middle_table.id = r.id
ORDER BY left_table.id, val_left, val_middle, val_right;
-- expected output:
-- 1 c, 2 a, 2 b, 3 c
SELECT * FROM merge_table ORDER BY id, val;
select sum(number) from numbers(10) settings final=1;
select sum(number) from remote('127.0.0.{1,2}', numbers(10)) settings final=1;
