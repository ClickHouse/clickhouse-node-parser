SELECT
    m[0],
    materialize(map('key', 42)) AS m; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}