DROP TABLE IF EXISTS a;

DROP TABLE IF EXISTS b;

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

DROP TABLE a;

DROP TABLE b;