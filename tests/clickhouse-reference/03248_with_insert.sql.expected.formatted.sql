CREATE TABLE x
ENGINE = Log AS
SELECT *
FROM numbers(0);

SELECT *
FROM x;

CREATE TABLE x
(
    d date
)
ENGINE = Log;