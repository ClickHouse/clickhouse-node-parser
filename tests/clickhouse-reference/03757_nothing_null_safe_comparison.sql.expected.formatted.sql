SELECT 1
WHERE (assumeNotNull(materialize(NULL)), 1) <=> (1, 1);

SELECT 1
WHERE assumeNotNull(materialize(NULL)) <=> 1;

SELECT 1
WHERE (1, 1) <=> (1, 1);

SELECT 1
WHERE (NULL, 1) <=> (NULL, 1);

SELECT 1
WHERE NULL <=> NULL;