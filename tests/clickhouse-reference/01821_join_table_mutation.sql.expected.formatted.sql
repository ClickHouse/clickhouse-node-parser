DROP TABLE IF EXISTS join_table_mutation;

CREATE TABLE join_table_mutation
(
    id Int32,
    name String
)
ENGINE = Join(`ANY`, `LEFT`, id);

INSERT INTO join_table_mutation SELECT
    number,
    toString(number)
FROM numbers(100);

SELECT count()
FROM join_table_mutation;

SELECT name
FROM join_table_mutation
WHERE id = 10;

INSERT INTO join_table_mutation;

DROP TABLE join_table_mutation;