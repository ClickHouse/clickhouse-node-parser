SELECT count()
FROM table_name;

SELECT count() < 50 * 5
FROM (
        SELECT *
        FROM table_name SAMPLE 50
    );