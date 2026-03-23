-- Tags: no-fasttest, no-parallel

DROP USER IF EXISTS test_user_03593;
DROP USER IF EXISTS test_user_03593_1;
CREATE USER test_user_03593;
CREATE USER test_user_03593_1;
SELECT access_type, access_object FROM system.grants WHERE user_name='test_user_03593';
DROP USER test_user_03593;
DROP USER test_user_03593_1;
