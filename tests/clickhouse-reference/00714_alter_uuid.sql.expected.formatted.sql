SELECT
    '00000000-0000-01f8-9cb8-cb1b82fb3900' AS str,
    toUUID(str);

SELECT
    toFixedString('00000000-0000-02f8-9cb8-cb1b82fb3900', 36) AS str,
    toUUID(str);

SELECT
    '00000000-0000-03f8-9cb8-cb1b82fb3900' AS str,
    CAST(str, 'UUID');

SELECT
    toFixedString('00000000-0000-04f8-9cb8-cb1b82fb3900', 36) AS str,
    CAST(str, 'UUID');

SELECT
    id0,
    id1
FROM uuid;

SELECT
    toTypeName(id0),
    toTypeName(id1)
FROM uuid;