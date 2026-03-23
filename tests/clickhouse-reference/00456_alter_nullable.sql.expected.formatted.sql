DROP TABLE IF EXISTS nullable_alter;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE nullable_alter
(
    d Date DEFAULT '2000-01-01',
    x String
)
ENGINE = MergeTree(d, d, 1);

INSERT INTO nullable_alter (x);

SELECT x
FROM nullable_alter
ORDER BY x ASC;

INSERT INTO nullable_alter (x);

SELECT x
FROM nullable_alter
ORDER BY x ASC;

DROP TABLE nullable_alter;