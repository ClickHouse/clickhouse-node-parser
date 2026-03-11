SELECT *
FROM (
        EXPLAIN PLAN header = 1, input_headers = 1
        SELECT 1
    )
WHERE notLike(`explain`, 'Expression%');

SELECT *
FROM (
        EXPLAIN PLAN header = 1, input_headers = 1, column_structure = 1
        SELECT 1
    )
WHERE notLike(`explain`, 'Expression%');