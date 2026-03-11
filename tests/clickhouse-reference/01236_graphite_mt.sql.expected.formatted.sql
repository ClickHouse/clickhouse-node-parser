SELECT
    key,
    Path,
    Value,
    Version,
    col
FROM test_graphite FINAL
ORDER BY
    key ASC,
    Path ASC,
    Time DESC;

SELECT
    key,
    Path,
    Value,
    Version,
    col
FROM test_graphite
ORDER BY
    key ASC,
    Path ASC,
    Time DESC;