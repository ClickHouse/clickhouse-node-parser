SELECT *
FROM `system`.`columns`
WHERE table = '03271_parametrized_v'
    AND database = currentDatabase();

SELECT *
FROM `system`.`columns`
WHERE table = '03271_parametrized_v_expl'
    AND database = currentDatabase();

SELECT *
FROM 03271_parametrized_v_expl_mismatch(upper_bound = 3); -- { serverError TYPE_MISMATCH }

SELECT *
FROM 03271_parametrized_v_expl(upper_bound = 3);