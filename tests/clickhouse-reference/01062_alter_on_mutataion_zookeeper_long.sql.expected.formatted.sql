SELECT sum(CAST(value AS UInt64))
FROM test_alter_on_mutation;

SELECT sum(value)
FROM test_alter_on_mutation;

SELECT sum(value1)
FROM test_alter_on_mutation;

SELECT *
FROM nested_alter;