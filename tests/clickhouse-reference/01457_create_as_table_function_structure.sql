SELECT * FROM tmp;
SELECT (*,).1 AS c, toTypeName(c) FROM tmp;
SELECT (*,).1 AS c, toTypeName(c) FROM test_01457.tf_remote;
SELECT (*,).1 AS c, toTypeName(c) FROM test_01457.tf_remote_explicit_structure;
SELECT (*,).1 AS c, toTypeName(c) FROM test_01457.tf_numbers;
SELECT (*,).1 AS c, toTypeName(c) FROM test_01457.tf_merge;
