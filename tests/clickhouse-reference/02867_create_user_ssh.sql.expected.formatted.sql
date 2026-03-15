-- negative tests
CREATE USER test_user_02867 IDENTIFIED WITH ssh_key BY KEY 'key0' TYPE 'ssh-rsa'; -- { serverError LIBSSH_ERROR }

CREATE USER test_user_02867 IDENTIFIED WITH ssh_key BY KEY 'key0' TYPE 'ssh-rsa', KEY 'key1' TYPE 'ssh-rsa'; -- { serverError LIBSSH_ERROR }

CREATE USER test_user_02867 IDENTIFIED WITH ssh_key BY KEY 'key0' TYPE 'ssh-rsa'; -- { serverError LIBSSH_ERROR }

CREATE USER test_user_02867 IDENTIFIED WITH ssh_key BY KEY 'key0' TYPE 'ssh-rsa';