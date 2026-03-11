SELECT
    toTypeName(first_value_respect_nullsState(dummy)),
    toTypeName(last_value_respect_nullsState(dummy))
FROM `system`.one;

SELECT first_value_respect_nullsMerge(t)
FROM (
        SELECT first_value_respect_nullsState(dummy) AS t
        FROM `system`.one
    );

SELECT first_value_respect_nullsMerge(t)
FROM (
        SELECT first_value_respect_nullsState(NULL::Nullable(UInt8)) AS t
        FROM `system`.one
    );

SELECT first_value_respect_nullsMerge(t)
FROM (
        SELECT first_value_respect_nullsState(number) AS t
        FROM numbers(5)
    );

SELECT first_value_respect_nullsMerge(t)
FROM (
        SELECT first_value_respect_nullsState(NULL::Nullable(UInt8)) AS t
        FROM numbers(5)
    );

SELECT last_value_respect_nullsMerge(t)
FROM (
        SELECT last_value_respect_nullsState(dummy) AS t
        FROM `system`.one
    );

SELECT last_value_respect_nullsMerge(t)
FROM (
        SELECT last_value_respect_nullsState(NULL::Nullable(UInt8)) AS t
        FROM `system`.one
    );

SELECT last_value_respect_nullsMerge(t)
FROM (
        SELECT last_value_respect_nullsState(number) AS t
        FROM numbers(5)
    );

SELECT last_value_respect_nullsMerge(t)
FROM (
        SELECT last_value_respect_nullsState(NULL::Nullable(UInt8)) AS t
        FROM numbers(5)
    );

SELECT first_value_respect_nullsMerge(t)
FROM (
        SELECT first_valueState(number) AS t
        FROM numbers(1)
    );

SELECT first_value_respect_nullsMerge(t)
FROM (
        SELECT last_value_respect_nullsState(number) AS t
        FROM numbers(1)
    );

SELECT last_value_respect_nullsMerge(t)
FROM (
        SELECT first_value_respect_nullsState(number) AS t
        FROM numbers(1)
    );

SELECT first_value_respect_nullsMerge(CAST(unhex('00'), 'AggregateFunction(any, UInt64)'));

SELECT first_value_respect_nullsMerge(CAST(unhex('00'), 'AggregateFunction(any_respect_nulls, UInt64)'));

SELECT first_value_respect_nullsMerge(CAST(unhex('01'), 'AggregateFunction(any_respect_nulls, UInt64)'));

SELECT finalizeAggregation(CAST(unhex('01'), 'AggregateFunction(any_respect_nulls, UInt64)'));

SELECT first_value_respect_nullsMerge(CAST(unhex('02'), 'AggregateFunction(any_respect_nulls, UInt64)'));

SELECT first_value_respect_nullsMerge(CAST(unhex('02'), 'AggregateFunction(any_respect_nulls, Nullable(UInt64))'));

SELECT finalizeAggregation(CAST(unhex('02'), 'AggregateFunction(any_respect_nulls, Nullable(UInt64))'));

SELECT first_value_respect_nullsMerge(CAST(unhex('03'), 'AggregateFunction(any_respect_nulls, UInt64)'));