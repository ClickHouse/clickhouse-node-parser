DROP TABLE IF EXISTS alter_00665;

CREATE TABLE alter_00665
(
    boolean_false Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO alter_00665 (boolean_false);

SELECT *
FROM alter_00665;

SELECT *
FROM alter_00665
ORDER BY boolean_false ASC;

DROP TABLE alter_00665;