-- Tags: race
SELECT
    'a}a' AS x,
    like(x, (concat('%', x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a}a' AS x,
    like(x, (concat('%', x) AS pat)),
    like(materialize(x), pat);

SELECT
    'a}a' AS x,
    like(x, (concat(x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a}a' AS x,
    like(x, (x AS pat)),
    like(materialize(x), pat);

SELECT
    'a{a' AS x,
    like(x, (concat('%', x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a{a' AS x,
    like(x, (concat('%', x) AS pat)),
    like(materialize(x), pat);

SELECT
    'a{a' AS x,
    like(x, (concat(x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a{a' AS x,
    like(x, (x AS pat)),
    like(materialize(x), pat);

SELECT
    '{a' AS x,
    like(x, (concat('%', x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    '{a' AS x,
    like(x, (concat('%', x) AS pat)),
    like(materialize(x), pat);

SELECT
    '{a' AS x,
    like(x, (concat(x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    '{a' AS x,
    like(x, (x AS pat)),
    like(materialize(x), pat);

SELECT
    'a{' AS x,
    like(x, (concat('%', x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a{' AS x,
    like(x, (concat('%', x) AS pat)),
    like(materialize(x), pat);

SELECT
    'a{' AS x,
    like(x, (concat(x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a{' AS x,
    like(x, (x AS pat)),
    like(materialize(x), pat);

SELECT
    'a}' AS x,
    like(x, (concat('%', x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a}' AS x,
    like(x, (concat('%', x) AS pat)),
    like(materialize(x), pat);

SELECT
    'a}' AS x,
    like(x, (concat(x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    'a}' AS x,
    like(x, (x AS pat)),
    like(materialize(x), pat);

SELECT
    '}a' AS x,
    like(x, (concat('%', x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    '}a' AS x,
    like(x, (concat('%', x) AS pat)),
    like(materialize(x), pat);

SELECT
    '}a' AS x,
    like(x, (concat(x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    '}a' AS x,
    like(x, (x AS pat)),
    like(materialize(x), pat);

SELECT
    '{a}' AS x,
    like(x, (concat('%', x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    '{a}' AS x,
    like(x, (concat('%', x) AS pat)),
    like(materialize(x), pat);

SELECT
    '{a}' AS x,
    like(x, (concat(x, '%') AS pat)),
    like(materialize(x), pat);

SELECT
    '{a}' AS x,
    like(x, (x AS pat)),
    like(materialize(x), pat);