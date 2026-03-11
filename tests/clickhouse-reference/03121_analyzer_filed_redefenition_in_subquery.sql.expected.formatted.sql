SELECT my_field
FROM (
        SELECT
            *,
            'redefined' AS my_field
        FROM test_subquery
    );

SELECT my_field
FROM (
        SELECT
            'redefined' AS my_field,
            *
        FROM test_subquery
    );

SELECT my_field
FROM (
        SELECT
            *,
            'redefined' AS my_field
        FROM (
                SELECT *
                FROM test_subquery
            )
    );