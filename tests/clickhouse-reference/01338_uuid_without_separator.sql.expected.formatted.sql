SELECT toUUID('417ddc5de5564d2795dda34d84e46a50');

SELECT toUUID('417ddc5d-e556-4d27-95dd-a34d84e46a50');

CREATE TABLE t_uuid
(
    x UInt8,
    y UUID,
    z String
)
ENGINE = TinyLog;

SELECT *
FROM t_uuid
ORDER BY x ASC;