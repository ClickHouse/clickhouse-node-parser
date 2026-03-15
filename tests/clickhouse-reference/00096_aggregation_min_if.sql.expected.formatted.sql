CREATE TABLE min_if
(
    arr Array(UInt8),
    str String,
    int Int32
)
ENGINE = Memory;

SELECT minIf(arr, notEmpty(arr))
FROM min_if;

SELECT minIf(str, notEmpty(str))
FROM min_if;

SELECT minIf(int, int != 0)
FROM min_if;