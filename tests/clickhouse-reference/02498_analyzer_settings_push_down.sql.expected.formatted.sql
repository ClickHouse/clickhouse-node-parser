SELECT value
FROM (
        SELECT tupleElement(value, 'a') AS value
        FROM test_table
    );

SELECT '--';