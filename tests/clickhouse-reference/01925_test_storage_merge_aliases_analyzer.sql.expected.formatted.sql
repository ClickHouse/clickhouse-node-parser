SELECT
    colAlias0,
    colAlias1,
    colAlias2,
    colAlias3
FROM alias_1;

SELECT
    colAlias3,
    colAlias2,
    colAlias1,
    colAlias0
FROM merge;

SELECT *
FROM merge;

SELECT
    colAlias0,
    colAlias1,
    colAlias2,
    colAlias3
FROM alias_2;

SELECT
    colAlias3,
    colAlias2,
    colAlias1,
    colAlias0
FROM merge
ORDER BY dt ASC;

SELECT *
FROM merge
ORDER BY dt ASC;