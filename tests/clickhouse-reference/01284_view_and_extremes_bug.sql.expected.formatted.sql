CREATE VIEW view_bug_const
AS
SELECT 'World' AS hello
FROM
    (
        SELECT number
        FROM `system`.numbers
        LIMIT 1
    ) AS n1
INNER JOIN (
        SELECT number
        FROM `system`.numbers
        LIMIT 1
    ) AS n2
    USING (number);

SELECT *
FROM view_bug_const;