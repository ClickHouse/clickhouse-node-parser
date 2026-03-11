SELECT *
FROM view((
        SELECT row_number()
        FROM numbers(3)
        WINDOW w AS ()
    ));

SELECT *
FROM viewExplain('EXPLAIN', '', (
        SELECT 1
        WINDOW w0 AS ()
    ));

SELECT number
FROM numbers(assumeNotNull(viewExplain('EXPLAIN', '', (
        SELECT 1
        WINDOW w0 AS ()
        QUALIFY number
    ))));