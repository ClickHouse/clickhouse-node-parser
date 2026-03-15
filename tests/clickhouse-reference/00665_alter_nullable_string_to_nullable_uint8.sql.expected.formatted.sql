CREATE TABLE alter_00665
(
    boolean_false Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT *
FROM alter_00665;

SELECT *
FROM alter_00665
ORDER BY boolean_false ASC;