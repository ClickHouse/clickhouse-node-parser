CREATE TABLE lc_nullable_string
(
    c1 LowCardinality(Nullable(String)) DEFAULT CAST(NULL, 'LowCardinality(Nullable(String))')
)
ENGINE = Memory;

INSERT INTO lc_nullable_string (c1);

INSERT INTO lc_nullable_string (c1);

SELECT *
FROM lc_nullable_string
ORDER BY c1 ASC;