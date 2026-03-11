SELECT * FROM id_val ANY LEFT JOIN id_val_join0 USING (id) SETTINGS join_use_nulls = 0;
SELECT * FROM id_val ANY LEFT JOIN id_val_join1 USING (id) SETTINGS join_use_nulls = 1;
