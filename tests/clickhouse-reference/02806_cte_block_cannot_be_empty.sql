select
    if(
        outer_table.condition_value = 1,
        formatRowNoNewline('JSONEachRow', outer_table.result_date),
        ''
    ) as json
from (
        select
            1 as condition_value,
            date_add(month, inner_table.offset, toDate('2023-06-24')) as result_date
        from (
            select
                2 as offset
            ) inner_table
    ) outer_table;
