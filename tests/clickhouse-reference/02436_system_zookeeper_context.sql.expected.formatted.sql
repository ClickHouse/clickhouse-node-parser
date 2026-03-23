DROP TABLE IF EXISTS mt;

CREATE TABLE mt
(
    n int,
    s String
)
ENGINE = MergeTree
ORDER BY n;

INSERT INTO mt;

SET allow_nondeterministic_mutations = 1;

SELECT DISTINCT n
FROM mt;

DROP TABLE mt;