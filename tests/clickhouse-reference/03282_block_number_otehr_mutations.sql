SELECT a, b FROM t_block_number_proj WHERE b = 5 SETTINGS force_optimize_projection = 1;
SELECT * FROM t_block_number_ttl ORDER BY a;
