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

INSERT INTO data2013 (name, value);

INSERT INTO data2013 (name, value);

INSERT INTO data2013 (name, value);

INSERT INTO data2014 (name, value);

INSERT INTO data2014 (name, value);

INSERT INTO data2014 (name, value);

SELECT
    nn,
    vv
FROM (
        SELECT
            name AS nn,
            value AS vv
        FROM data2013
        UNION ALL
        SELECT
            name AS nn,
            value AS vv
        FROM data2014
    )
ORDER BY
    nn ASC,
    vv ASC;