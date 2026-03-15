SET readonly = 2;

CREATE TEMPORARY TABLE readonly00542
(
    ID Int
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT ID
FROM readonly00542
ORDER BY ID ASC;

SELECT '---';