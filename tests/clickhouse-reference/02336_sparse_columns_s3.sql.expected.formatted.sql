SELECT serialization_kind
FROM `system`.parts_columns
WHERE table = 't_sparse_s3'
    AND active
    AND column = 's'
    AND database = currentDatabase();

SELECT count()
FROM t_sparse_s3
PREWHERE cond
WHERE id IN (1, 3, 5, 7, 9, 11, 13, 15, 17)
    AND NOT ignore(s);