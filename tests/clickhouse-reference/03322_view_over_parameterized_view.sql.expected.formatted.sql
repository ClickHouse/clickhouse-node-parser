CREATE VIEW v
AS
SELECT number
FROM numbers(5)
WHERE number % 2 = {parity:Int8};

CREATE TABLE vv
(
    number Int8
)
ENGINE = Merge(currentDatabase(), 'v');

SELECT *
FROM vv; -- { serverError STORAGE_REQUIRES_PARAMETER }