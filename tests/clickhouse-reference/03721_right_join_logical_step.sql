SELECT ty.c0 FROM t0 RIGHT JOIN numbers(1) AS tx ON number = t0.c1 AND tx.number = t0.c0 CROSS JOIN t0 ty SETTINGS query_plan_join_swap_table = true, query_plan_use_new_logical_join_step = false;
