SELECT
    dictGet('test_dict_db.table1_dict', 'col6', (col1, col2, col3, col4, col5)),
    dictGet('test_dict_db.table1_dict', 'col7', (col1, col2, col3, col4, col5)),
    dictGet('test_dict_db.table1_dict', 'col8', (col1, col2, col3, col4, col5)),
    dictGet('test_dict_db.table1_dict', 'col9', (col1, col2, col3, col4, col5))
FROM test_dict_db.table1
WHERE dictHas('test_dict_db.table1_dict', (col1, col2, col3, col4, col5)); -- { serverError CANNOT_INSERT_NULL_IN_ORDINARY_COLUMN }

SELECT
    dictGet('test_dict_db.table1_dict', 'col6', (col1, col2, col3, col4, col5)),
    dictGet('test_dict_db.table1_dict', 'col7', (col1, col2, col3, col4, col5)),
    dictGet('test_dict_db.table1_dict', 'col8', (col1, col2, col3, col4, col5)),
    dictGet('test_dict_db.table1_dict', 'col9', (col1, col2, col3, col4, col5))
FROM test_dict_db.table1
WHERE dictHas('test_dict_db.table1_dict', (col1, col2, col3, col4, col5))
ORDER BY
    col1 ASC,
    col2 ASC,
    col3 ASC,
    col4 ASC,
    col5 ASC,
    col14 ASC,
    col17 ASC;