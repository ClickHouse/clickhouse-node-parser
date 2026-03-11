SELECT * FROM lwu_on_fly ORDER BY id settings apply_mutations_on_fly = 1, apply_patch_parts = 1;
SELECT count() FROM lwu_on_fly WHERE NOT ignore(*) SETTINGS apply_mutations_on_fly = 1, apply_patch_parts = 1;
