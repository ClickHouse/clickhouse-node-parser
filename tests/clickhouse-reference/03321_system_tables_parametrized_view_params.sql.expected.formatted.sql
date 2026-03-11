SELECT '-----------------------------------------';

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_one_param';

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_multiple_params';

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_one_param_temporary';

SELECT
    name,
    engine,
    parameterized_view_parameters
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'parameterized_view_multiple_params_temporary';