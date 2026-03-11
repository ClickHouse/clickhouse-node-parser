SELECT alias2 AS alias3
FROM table 
ARRAY JOIN
    arr_alias AS alias2, 
    arrayEnumerateUniq(arr_alias) AS _uniq_Event
WHERE (date = toDate('2010-10-10')) AND (a IN (2, 3)) AND (str NOT IN ('z', 'x')) AND (d != -1)
LIMIT 1;
