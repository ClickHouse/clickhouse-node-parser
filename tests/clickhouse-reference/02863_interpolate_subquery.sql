SELECT i, col1 FROM (
    SELECT i, a AS col1, a AS col2 FROM tab ORDER BY i WITH FILL INTERPOLATE (col1 AS col1+col2, col2)
);
