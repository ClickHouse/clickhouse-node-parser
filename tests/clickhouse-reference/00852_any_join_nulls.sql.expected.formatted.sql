CREATE TABLE table1
(
    id String
)
ENGINE = Log;

CREATE TABLE table2
(
    parent_id String
)
ENGINE = Log;

SELECT
    table2.parent_id = '',
    isNull(table2.parent_id)
FROM
    table1
LEFT JOIN table2
    ON table1.id = table2.parent_id;

SET join_use_nulls = 1;