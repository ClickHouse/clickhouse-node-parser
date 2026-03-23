DROP VIEW IF EXISTS slow_view1;

CREATE VIEW slow_view1
AS
WITH c1 AS (
    SELECT 1 AS a
),

c2 AS (
    SELECT a
    FROM c1
),

c3 AS (
    SELECT a
    FROM c2
),

c4 AS (
    SELECT a
    FROM c3
),

c5 AS (
    SELECT a
    FROM c4
),

c6 AS (
    SELECT a
    FROM c5
),

c7 AS (
    SELECT a
    FROM c6
),

c8 AS (
    SELECT a
    FROM c7
),

c9 AS (
    SELECT a
    FROM c8
),

c10 AS (
    SELECT a
    FROM c9
),

c11 AS (
    SELECT a
    FROM c10
),

c12 AS (
    SELECT a
    FROM c11
),

c13 AS (
    SELECT a
    FROM c12
),

c14 AS (
    SELECT a
    FROM c13
),

c15 AS (
    SELECT a
    FROM c14
),

c16 AS (
    SELECT a
    FROM c15
),

c17 AS (
    SELECT a
    FROM c16
),

c18 AS (
    SELECT a
    FROM c17
),

c19 AS (
    SELECT a
    FROM c18
),

c20 AS (
    SELECT a
    FROM c19
),

c21 AS (
    SELECT a
    FROM c20
),

c22 AS (
    SELECT a
    FROM c21
),

c23 AS (
    SELECT a
    FROM c22
),

c24 AS (
    SELECT a
    FROM c23
),

c25 AS (
    SELECT a
    FROM c24
),

c26 AS (
    SELECT a
    FROM c25
),

c27 AS (
    SELECT a
    FROM c26
),

c28 AS (
    SELECT a
    FROM c27
),

c29 AS (
    SELECT a
    FROM c28
),

c30 AS (
    SELECT a
    FROM c29
),

c31 AS (
    SELECT a
    FROM c30
),

c32 AS (
    SELECT a
    FROM c31
),

c33 AS (
    SELECT a
    FROM c32
),

c34 AS (
    SELECT a
    FROM c33
),

c35 AS (
    SELECT a
    FROM c34
),

c36 AS (
    SELECT a
    FROM c35
),

c37 AS (
    SELECT a
    FROM c36
),

c38 AS (
    SELECT a
    FROM c37
),

c39 AS (
    SELECT a
    FROM c38
),

c40 AS (
    SELECT a
    FROM c39
)

SELECT a
FROM c21;