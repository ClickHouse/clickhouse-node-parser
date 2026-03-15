CREATE TABLE data2013
(
    name String,
    value UInt32
)
ENGINE = Memory;

CREATE TABLE data2014
(
    name String,
    value UInt32
)
ENGINE = Memory;

SELECT val
FROM (
        SELECT value AS val
        FROM data2013
        WHERE name = 'Alice'
        UNION ALL
        SELECT value AS val
        FROM data2014
        WHERE name = 'Alice'
        UNION ALL
        SELECT value AS val
        FROM data2014
        WHERE name = 'Dennis'
    )
ORDER BY val ASC;