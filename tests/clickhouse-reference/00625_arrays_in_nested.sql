DROP TABLE IF EXISTS nested;
CREATE TABLE nested
(
    column Nested
    (
        name String,
        names Array(String),
        types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3))
    )
) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO nested VALUES (['Hello', 'World'], [['a'], ['b', 'c']], [['PU', 'US'], ['OTHER']]);
SELECT * FROM nested;
INSERT INTO nested VALUES (['GoodBye'], [['1', '2']], [['PU', 'US', 'OTHER']]);
SELECT * FROM nested ORDER BY column.name;
CREATE TABLE nested
(
    column Nested
    (
        name String,
        names Array(String),
        types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3))
    )
) ENGINE = Log;
CREATE TABLE nested
(
    column Nested
    (
        name String,
        names Array(String),
        types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3))
    )
) ENGINE = TinyLog;
CREATE TABLE nested
(
    column Nested
    (
        name String,
        names Array(String),
        types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3))
    )
) ENGINE = StripeLog;
CREATE TABLE nested
(
    column Nested
    (
        name String,
        names Array(String),
        types Array(Enum8('PU' = 1, 'US' = 2, 'OTHER' = 3))
    )
) ENGINE = Memory;
DROP TABLE nested;
