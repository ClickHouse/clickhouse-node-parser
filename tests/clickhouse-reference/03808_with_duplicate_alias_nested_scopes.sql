-- Three levels of nesting with the same WITH alias at each level
SELECT * FROM (
    WITH CAST('11', 'Int128') AS a1
    SELECT c0 FROM (
        WITH CAST('11', 'Int128') AS a1
        SELECT c0 FROM (
            WITH CAST('11', 'Int128') AS a1
            SELECT CAST('38', 'UInt16') AS a0
        ) (c0)
    ) (c0)
) (c0);
-- Simpler 3-level variant
SELECT * FROM (
    WITH 1 AS x
    SELECT * FROM (
        WITH 1 AS x
        SELECT * FROM (
            WITH 1 AS x
            SELECT 1 AS col
        ) AS t3
    ) AS t2
) AS t1;
