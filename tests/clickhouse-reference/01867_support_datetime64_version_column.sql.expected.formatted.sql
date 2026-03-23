SYSTEM drop  table if exists replacing;

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

SELECT *
FROM replacing;

SYSTEM drop  table replacing;