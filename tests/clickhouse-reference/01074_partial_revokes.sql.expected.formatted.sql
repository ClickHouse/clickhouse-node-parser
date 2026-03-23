-- Tags: no-parallel
DROP USER IF EXISTS test_user_01074;

CREATE USER test_user_01074;

SELECT '--simple 1';

SELECT *
FROM `system`.grants
WHERE user_name = 'test_user_01074'
SETTINGS output_format_pretty_color = 1
FORMAT Pretty;

DROP USER test_user_01074;