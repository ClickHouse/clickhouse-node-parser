-- Tags: no-fasttest, no-parallel
DROP USER IF EXISTS test_user_01075, test_user_01075_x, test_user_01075_x@localhost, test_user_01075_x@'192.168.23.15';

CREATE USER test_user_01075;

DROP USER test_user_01075;

CREATE USER test_user_01075_x@localhost;

DROP USER 'test_user_01075_x@192.168.23.15';