SELECT
    attr,
    _id,
    arrayFilter(x -> (x IN (
        SELECT '1'
    )), attr_list) AS z
FROM
    TESTTABLE
ARRAY JOIN z AS attr
ORDER BY _id ASC
LIMIT 3 BY attr;