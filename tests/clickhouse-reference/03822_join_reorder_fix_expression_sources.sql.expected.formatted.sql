SELECT table1.id
FROM
    table1
INNER JOIN table2
    ON table1.id = table2.id
INNER JOIN table3
    ON table1.id = table3.id
LEFT JOIN table4
    ON (table1.val = table4.v)
    AND (table3.id = table4.v)
ORDER BY table1.id ASC;