-- output 1 sorted stream
SELECT row_number() OVER (ORDER BY 1 ASC, a ASC)
FROM order_by_const
SETTINGS query_plan_enable_multithreading_after_window_functions = 0;

-- expressions in window frame
SELECT count() OVER (ROWS BETWEEN 1 + 1 PRECEDING AND 1 + 1 FOLLOWING)
FROM numbers(10);

-- signed and unsigned in offset do not cause logical error
SELECT count() OVER (ROWS BETWEEN 2 FOLLOWING AND 1 + -1 FOLLOWING)
FROM numbers(10); -- { serverError BAD_ARGUMENTS }

-- default arguments of lagInFrame can be a subtype of the argument
SELECT
    number,
    lagInFrame(toNullable(number), 2, NULL),
    lagInFrame(number, 2, 1)
FROM numbers(10)
WINDOW w AS (order by number);

-- the case when current_row goes past the partition end at the block end
SELECT
    number,
    row_number() OVER (PARTITION BY number ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING)
FROM numbers(4)
SETTINGS max_block_size = 2;