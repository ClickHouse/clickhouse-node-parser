CREATE TABLE `/t0`
(
    a Int64,
    b Int64
)
ENGINE = MergeTree()
ORDER BY a
PARTITION BY a;

CREATE TABLE `/t1`
(
    a Int64,
    b Int64
)
ENGINE = MergeTree()
ORDER BY a
PARTITION BY a;

INSERT INTO `/t0`;

INSERT INTO `/t1`;

SELECT *
FROM
    `/t0`
INNER JOIN `/t1`
    USING (a);