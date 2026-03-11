SELECT val < 1.5
    AND val > 1.459
FROM (
        SELECT entropy(vals) AS val
        FROM defaults
    );

SELECT val < 2.4
    AND val > 2.3393
FROM (
        SELECT entropy(vals) AS val
        FROM defaults
    );

SELECT val < 2.189
    AND val > 2.1886
FROM (
        SELECT entropy(vals) AS val
        FROM defaults
    );