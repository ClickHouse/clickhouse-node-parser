CREATE TABLE dict_03204
(
    k UInt64,
    v UInt64
)
ENGINE = Join(`ANY`, `LEFT`, k);

SELECT *
FROM dict_03204
ORDER BY k ASC;