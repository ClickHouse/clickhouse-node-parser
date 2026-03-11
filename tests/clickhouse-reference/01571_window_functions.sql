-- output 1 sorted stream
SELECT row_number() OVER (order by 1, a) FROM order_by_const SETTINGS query_plan_enable_multithreading_after_window_functions=0;
-- expressions in window frame
select count() over (rows between 1 + 1 preceding and 1 + 1 following) from numbers(10);
-- signed and unsigned in offset do not cause logical error
select count() over (rows between 2 following and 1 + -1 following) FROM numbers(10); -- { serverError BAD_ARGUMENTS }
-- default arguments of lagInFrame can be a subtype of the argument
select number,
    lagInFrame(toNullable(number), 2, null) over w,
    lagInFrame(number, 2, 1) over w
from numbers(10)
window w as (order by number)
;
-- the case when current_row goes past the partition end at the block end
select number, row_number() over (partition by number rows between unbounded preceding and 1 preceding) from numbers(4) settings max_block_size = 2;
