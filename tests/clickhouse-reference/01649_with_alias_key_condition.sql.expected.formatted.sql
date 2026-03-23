SYSTEM drop  table if exists alias_key_condition;

CREATE TABLE alias_key_condition
(
    i int,
    j int
)
ENGINE = MergeTree
ORDER BY i;

INSERT INTO alias_key_condition;

SET force_primary_key = 1;