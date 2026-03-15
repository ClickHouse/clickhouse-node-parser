CREATE TABLE APPLICATION
(
    Name LowCardinality(String),
    Base LowCardinality(String)
)
ENGINE = Memory();

CREATE TABLE DATABASE_IO
(
    Application LowCardinality(String),
    Base LowCardinality(String),
    Date DateTime,
    Ios UInt32
)
ENGINE = MergeTree()
ORDER BY Date;

SELECT
    APPLICATION.Name AS App,
    CAST(CAST(DATABASE_IO.Date AS DATE) AS DATE) AS date
FROM
    DATABASE_IO
INNER JOIN APPLICATION
    ON (DATABASE_IO.Base = APPLICATION.Base)
WHERE (CAST(CAST(DATABASE_IO.Date AS DATE) AS TIMESTAMP) >= toDateTime('2020-01-01 00:00:00'));