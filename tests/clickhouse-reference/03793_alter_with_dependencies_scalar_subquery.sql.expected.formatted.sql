SELECT
    'foo_without_dependencies',
    x
FROM foo_without_dependencies
ORDER BY x ASC;

SELECT
    'foo_with_index',
    x
FROM foo_with_index
ORDER BY x ASC;

SELECT
    'foo_with_projection',
    x
FROM foo_with_projection
ORDER BY x ASC;