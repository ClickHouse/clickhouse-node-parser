select dt, id, arraySort(groupArrayArray(arr))
from (
    select dt, id, arr from table1
    where dt = '2019-01-14' and id = 1
    UNION ALL
    select dt, id, arr from table2
    where dt = '2019-01-14' and id = 1
)
group by dt, id;
