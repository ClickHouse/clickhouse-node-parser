SELECT attr, _id, arrayFilter(x -> (x IN (select '1')), attr_list) z
FROM TESTTABLE ARRAY JOIN z AS attr ORDER BY _id LIMIT 3 BY attr;
