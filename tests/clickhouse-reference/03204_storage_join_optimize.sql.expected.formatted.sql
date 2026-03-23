CREATE TABLE dict_03204
(
    k UInt64,
    v UInt64
)
ENGINE = Join(`ANY`, `LEFT`, k);

INSERT INTO dict_03204 SELECT
    number,
    number
FROM numbers(10);

SELECT *
FROM dict_03204
ORDER BY k ASC;

SYSTEM DROP  TABLE dict_03204;