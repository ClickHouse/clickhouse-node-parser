CREATE TABLE check_constraint
(
    c0 Int
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT 1
FROM check_constraint
WHERE 1 = 1
SETTINGS
    optimize_substitute_columns = 1,
    convert_query_to_cnf = 1;

CREATE TABLE assume_constraint
(
    c0 Int
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT 1
FROM assume_constraint
WHERE 1 = 1
SETTINGS
    optimize_substitute_columns = 1,
    convert_query_to_cnf = 1;