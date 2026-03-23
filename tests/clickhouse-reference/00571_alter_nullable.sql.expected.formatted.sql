CREATE TABLE nullable_00571
(
    x String
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO nullable_00571;

SELECT *
FROM nullable_00571;