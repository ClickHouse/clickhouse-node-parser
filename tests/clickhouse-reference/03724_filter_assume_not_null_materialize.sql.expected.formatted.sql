SELECT (assumeNotNull((NULL)), 1);

SELECT (assumeNotNull(materialize(NULL)), 1);

SELECT 1
WHERE (assumeNotNull(NULL), 1) = (1, 1);

SELECT 1
WHERE (assumeNotNull(materialize(NULL)), 1) = (1, 1);