SELECT count() > 3
FROM (
        EXPLAIN PIPELINE header = 1
        SELECT *
        FROM `system`.numbers
        ORDER BY number DESC
    )
WHERE like(`explain`, '%Header: number UInt64%');

SELECT count() > 0
FROM (
        EXPLAIN PLAN
        SELECT *
        FROM `system`.numbers
        ORDER BY number DESC
    )
WHERE ilike(`explain`, '%Sort%');

SELECT count() > 0
FROM (
        EXPLAIN
        SELECT *
        FROM `system`.numbers
        ORDER BY number DESC
    )
WHERE ilike(`explain`, '%Sort%');

SELECT count() > 0
FROM (
        EXPLAIN CURRENT TRANSACTION
    );

SELECT count() == 1
FROM (
        EXPLAIN SYNTAX
        SELECT number
        FROM `system`.numbers
        ORDER BY number DESC
    )
WHERE ilike(`explain`, 'SELECT%');

SELECT trim(`explain`) == 'Asterisk'
FROM (
        EXPLAIN AST
        SELECT *
        FROM `system`.numbers
        LIMIT 10
    )
WHERE like(`explain`, '%Asterisk%');

SELECT *
FROM (
        EXPLAIN AST
        SELECT *
        FROM (
                EXPLAIN PLAN
                SELECT *
                FROM (
                        EXPLAIN SYNTAX
                        SELECT trim(`explain`) == 'Asterisk'
                        FROM (
                                EXPLAIN AST
                                SELECT *
                                FROM `system`.numbers
                                LIMIT 10
                            )
                        WHERE like(`explain`, '%Asterisk%')
                    )
            )
    )
FORMAT Null;

SELECT (
        EXPLAIN SYNTAX oneline = 1
        SELECT 1
    ) == 'SELECT 1';

SELECT *
FROM viewExplain('', ''); -- { serverError BAD_ARGUMENTS }

SELECT *
FROM viewExplain('EXPLAIN AST', ''); -- { serverError BAD_ARGUMENTS }

SELECT *
FROM viewExplain('EXPLAIN AST', '', 1); -- { serverError BAD_ARGUMENTS }

SELECT *
FROM viewExplain('EXPLAIN AST', '', ''); -- { serverError BAD_ARGUMENTS }

SELECT `rows` > 1000
FROM (
        EXPLAIN ESTIMATE
        SELECT sum(a)
        FROM t1
    );

SELECT count() == 1
FROM (
        EXPLAIN ESTIMATE
        SELECT sum(a)
        FROM t1
    );

SELECT count() > 3
FROM (
        EXPLAIN PIPELINE header = 1
        SELECT *
        FROM `system`.numbers
        ORDER BY number DESC
    )
WHERE like(`explain`, '%Header: \\_\\_table1.number UInt64%');

SELECT (
        EXPLAIN SYNTAX oneline = 1
        SELECT 1
    ) == 'SELECT 1 FROM system.one';