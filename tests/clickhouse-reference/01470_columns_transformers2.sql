SELECT  * EXCEPT 'bytes', COLUMNS('bytes') APPLY formatReadableSize FROM columns_transformers;
SELECT * APPLY x->argMax(x, number) FROM numbers(1);
