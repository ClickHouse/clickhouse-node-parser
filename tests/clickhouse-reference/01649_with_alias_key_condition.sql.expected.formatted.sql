CREATE TABLE alias_key_condition
(
    i int,
    j int
)
ENGINE = MergeTree
ORDER BY i;

SET force_primary_key = 1;