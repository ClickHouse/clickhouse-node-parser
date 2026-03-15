CREATE TABLE t
(
    letter String
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY letter;

SELECT anyHeavy(if(letter != 'b', letter, NULL))
FROM t;