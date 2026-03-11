SELECT
    cast((1, 'Value'), 'Tuple (id UInt64, value String)') AS value,
    value.id,
    value.value;

SELECT
    cast((1, 'Value'), 'Tuple (id UInt64, value String)') AS value,
    value.* APPLY(toString);

SELECT
    cast((1, 'Value'), 'Tuple (id UInt64, value String)') AS value,
    value.COLUMNS(id) APPLY(toString);

SELECT
    cast((1, 'Value'), 'Tuple (id UInt64, value String)') AS value,
    value.COLUMNS(value) APPLY(toString);

SELECT
    cast((1, 'Value'), 'Tuple (id UInt64, value String)') AS value,
    value.COLUMNS('i') APPLY(toString);

SELECT
    cast((1, 'Value'), 'Tuple (id UInt64, value String)') AS value,
    value.COLUMNS('v') APPLY(toString);

SELECT '--';

SELECT *
FROM test_table;

SELECT
    id,
    value
FROM test_table;

SELECT
    value.value_0_level_0,
    value.value_1_level_0
FROM test_table;

SELECT
    value AS alias_value,
    alias_value.value_0_level_0,
    alias_value.value_1_level_0
FROM test_table;

SELECT
    value AS alias_value,
    alias_value.*
FROM test_table;

SELECT
    value AS alias_value,
    alias_value.* APPLY(toString)
FROM test_table;

SELECT value.*
FROM test_table;

SELECT value.* APPLY(toString)
FROM test_table;

SELECT
    value.value_0_level_0.value_0_level_1,
    value.value_0_level_0.value_1_level_1
FROM test_table;

SELECT
    value.value_0_level_0 AS alias_value,
    alias_value.value_0_level_1,
    alias_value.value_1_level_1
FROM test_table;

SELECT
    value.value_0_level_0 AS alias_value,
    alias_value.*
FROM test_table;

SELECT
    value.value_0_level_0 AS alias_value,
    alias_value.* APPLY(toString)
FROM test_table;

SELECT value.value_0_level_0.*
FROM test_table;

SELECT value.value_0_level_0.* APPLY(toString)
FROM test_table;

SELECT
    value.value_0_level_0 AS value_alias,
    value_alias.value_0_level_1,
    value_alias.value_1_level_1
FROM test_table;

SELECT
    value.value_0_level_0 AS value_alias,
    value_alias.*
FROM test_table;

SELECT
    value.value_0_level_0 AS value_alias,
    value_alias.* APPLY(toString)
FROM test_table;