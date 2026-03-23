CREATE TABLE json
(
    x UInt8,
    title String
)
ENGINE = Memory;

INSERT INTO json;

SELECT *
FROM json
ORDER BY title ASC;