CREATE USER 02911_user ON CLUSTER test_shard_localhost;
CREATE ROW POLICY 02911_rowpolicy ON CLUSTER test_shard_localhost ON default.* USING 1 TO 02911_user;
