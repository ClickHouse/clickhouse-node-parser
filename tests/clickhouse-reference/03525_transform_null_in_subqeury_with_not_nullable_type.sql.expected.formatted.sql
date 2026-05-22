SET transform_null_in = 1;

SELECT NULL::Nullable(String) IN (
        SELECT 'abc'
    );

SELECT (null::Nullable(String), 42) IN (
        SELECT
            'abc',
            42
    );

SELECT (null::Nullable(String), null::Nullable(UInt32)) IN (
        SELECT
            'abc',
            42
    );

SELECT (if(number % 2, NULL, 'abc')) IN (
        SELECT 'abc'
    )
FROM numbers(2);

SELECT (number % 2 ? null : 'abc', materialize(42)) IN (
        SELECT
            'abc',
            42
    )
FROM numbers(2);

SELECT (number % 2 == 0 ? null : 'abc', number < 2 ? null : 42) IN (
        SELECT
            'abc',
            42
    )
FROM numbers(4);