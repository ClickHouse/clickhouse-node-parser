CREATE TABLE json
(
    x Enum8('browser' = 1, 'mobile' = 2),
    y String
)
ENGINE = Memory;

SELECT *
FROM json
ORDER BY y ASC;