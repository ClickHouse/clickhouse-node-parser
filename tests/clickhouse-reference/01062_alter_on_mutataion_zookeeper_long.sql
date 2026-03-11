SELECT sum(cast(value as UInt64)) from test_alter_on_mutation;
SELECT sum(value) from test_alter_on_mutation;
SELECT sum(value1) from test_alter_on_mutation;
SELECT * FROM nested_alter;
