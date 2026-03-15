SET param_password = 'test_password_03773';

-- Before fix: This would fail with UNKNOWN_QUERY_PARAMETER on remote nodes
CREATE USER user_param_auth_03773 IDENTIFIED BY '{password:String}' ON CLUSTER test_shard_localhost;