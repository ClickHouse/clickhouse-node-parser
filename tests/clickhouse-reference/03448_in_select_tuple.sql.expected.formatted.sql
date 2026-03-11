SELECT *
FROM table1
WHERE (id1, id2) IN (
        SELECT tuple(id1, id2)
        FROM table2
    );