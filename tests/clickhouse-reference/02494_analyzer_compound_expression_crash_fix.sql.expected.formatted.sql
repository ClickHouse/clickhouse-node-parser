SELECT fields.name
FROM (
        SELECT fields.name
        FROM test_table
    );

SELECT
    fields.name,
    fields.value
FROM (
        SELECT fields.name
        FROM test_table
    );