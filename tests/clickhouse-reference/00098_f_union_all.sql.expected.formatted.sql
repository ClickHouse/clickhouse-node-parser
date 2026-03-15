CREATE TABLE data2013
(
    name String,
    value UInt32
)
ENGINE = Memory;

CREATE TABLE data2015
(
    data_name String,
    data_value UInt32
)
ENGINE = Memory;

SELECT name
FROM (
        SELECT name
        FROM data2013
        UNION ALL
        SELECT data_name AS name
        FROM data2015
    )
ORDER BY name ASC;