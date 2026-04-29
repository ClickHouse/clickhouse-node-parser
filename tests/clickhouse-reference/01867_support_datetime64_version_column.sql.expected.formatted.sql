DROP TABLE IF EXISTS replacing;

CREATE TABLE replacing
(
    A Int64,
    D DateTime64(9, 'Asia/Istanbul'),
    S String
)
ENGINE = ReplacingMergeTree(D)
ORDER BY A;

INSERT INTO replacing;

INSERT INTO replacing;

INSERT INTO replacing;

INSERT INTO replacing;

INSERT INTO replacing;

INSERT INTO replacing;

INSERT INTO replacing;

OPTIMIZE TABLE replacing FINAL;

SELECT *
FROM replacing;

DROP TABLE replacing;