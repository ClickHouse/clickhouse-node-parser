SELECT *
FROM
    foo_distributed
INNER JOIN _tmp_baz
    ON foo_distributed.bar = _tmp_baz.qux;