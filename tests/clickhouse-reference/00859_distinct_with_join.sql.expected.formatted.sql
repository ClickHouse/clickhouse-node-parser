CREATE TABLE fooL
(
    a Int32,
    v String
)
ENGINE = Memory;

CREATE TABLE fooR
(
    a Int32,
    v String
)
ENGINE = Memory;

SELECT DISTINCT a
FROM
    fooL
LEFT JOIN fooR
    USING (a)
ORDER BY a ASC;