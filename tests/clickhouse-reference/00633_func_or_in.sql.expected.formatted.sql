SYSTEM drop  table if exists orin_test;

CREATE TABLE orin_test
(
    c1 Int32
)
ENGINE = Memory;

INSERT INTO orin_test;

SELECT minus(c1 = 1
    OR c1 = 2
    OR c1 = 3, c1 = 5)
FROM orin_test;

SYSTEM drop  table orin_test;