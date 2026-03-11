SELECT count()
FROM t_s3_compressed_blocks
WHERE NOT ignore(s);