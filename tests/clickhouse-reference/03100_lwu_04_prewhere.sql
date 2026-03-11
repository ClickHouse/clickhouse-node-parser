SELECT * FROM t_shared ORDER BY id SETTINGS apply_patch_parts = 0;
SELECT * FROM t_shared ORDER BY id SETTINGS apply_patch_parts = 1;
SELECT * FROM t_shared PREWHERE c2 = 'aaa' AND c1 = 111;
SELECT * FROM t_shared WHERE c2 = 'aaa' AND c1 = 111;
SELECT * FROM t_shared PREWHERE c2 = 'aaa' WHERE c1 = 111;
