SELECT *
FROM (
        EXPLAIN AST
        SELECT *
        FROM numbers(10)
    );