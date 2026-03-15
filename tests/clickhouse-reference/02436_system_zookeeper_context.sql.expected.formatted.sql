CREATE TABLE mt
(
    n int,
    s String
)
ENGINE = MergeTree
ORDER BY n;

SET allow_nondeterministic_mutations = 1;

SELECT DISTINCT n
FROM mt;