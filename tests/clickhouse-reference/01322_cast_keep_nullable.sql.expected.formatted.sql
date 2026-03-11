SELECT
    CAST(toNullable(toInt32(0)) AS Int32) AS x,
    toTypeName(x);

SELECT
    CAST(toNullable(toInt8(0)) AS Int32) AS x,
    toTypeName(x);

SELECT
    CAST(toNullable(toInt32(1)) AS Int32) AS x,
    toTypeName(x);

SELECT
    CAST(toNullable(toInt8(1)) AS Int32) AS x,
    toTypeName(x);

SELECT
    CAST(toNullable(toFloat32(2)), 'Float32') AS x,
    toTypeName(x);

SELECT
    CAST(toNullable(toFloat32(2)), 'UInt8') AS x,
    toTypeName(x);

SELECT
    CAST(if(1 = 1, toNullable(toInt8(3)), NULL) AS Int32) AS x,
    toTypeName(x);

SELECT
    CAST(if(1 = 0, toNullable(toInt8(3)), NULL) AS Int32) AS x,
    toTypeName(x);

SELECT
    CAST(a, 'Int32') AS x,
    toTypeName(x)
FROM (
        SELECT materialize(CAST(42, 'Nullable(UInt8)')) AS a
    );

SELECT
    CAST(a, 'Int32') AS x,
    toTypeName(x)
FROM (
        SELECT materialize(CAST(NULL, 'Nullable(UInt8)')) AS a
    );