CREATE VIEW a
AS
SELECT 'a' AS id;

CREATE VIEW b
AS
SELECT
    'a' AS id,
    'b' AS other;

SELECT *
FROM b
WHERE id IN (
        SELECT id
        FROM a
    );