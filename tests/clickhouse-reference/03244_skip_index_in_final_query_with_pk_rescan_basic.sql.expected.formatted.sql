SELECT *
FROM data_02201 FINAL
WHERE value_max = 1
ORDER BY
    key ASC,
    value_max ASC
SETTINGS
    use_skip_indexes = 0,
    use_skip_indexes_if_final = 0;

SELECT *
FROM data_02201 FINAL
WHERE value_max = 1
ORDER BY
    key ASC,
    value_max ASC
SETTINGS
    use_skip_indexes = 1,
    use_skip_indexes_if_final = 1,
    use_skip_indexes_if_final_exact_mode = 0;

SELECT *
FROM data_02201 FINAL
WHERE value_max = 1
ORDER BY
    key ASC,
    value_max ASC
SETTINGS
    use_skip_indexes = 1,
    use_skip_indexes_if_final = 1,
    use_skip_indexes_if_final_exact_mode = 1;