CREATE USER OR REPLACE 'test_01605';

CREATE OR REPLACE SETTINGS PROFILE 'test_01605';

SELECT *
FROM `system`.settings_profile_elements
WHERE user_name = 'test_01605'
    OR profile_name = 'test_01605';