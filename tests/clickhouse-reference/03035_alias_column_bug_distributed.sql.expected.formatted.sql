SELECT
    theAlias,
    CAST(NULL, 'Nullable(String)') AS src
FROM alias_bug
LIMIT 1
FORMAT Null;

SELECT
    theAlias,
    CAST(NULL, 'Nullable(String)') AS src
FROM alias_bug_dist
LIMIT 1
FORMAT Null;

SELECT
    CAST(123, 'String') AS src,
    theAlias
FROM alias_bug_dist
LIMIT 1
FORMAT Null;