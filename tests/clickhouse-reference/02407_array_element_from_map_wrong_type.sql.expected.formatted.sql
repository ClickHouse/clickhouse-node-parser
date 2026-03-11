SELECT
    m[0],
    materialize(map('key', 42)) AS m;