CREATE TABLE table_with_complex_default
(
    i Int8,
    n UInt8 DEFAULT 42,
    s String DEFAULT concat('test', CAST(n, 'String'))
)
ENGINE = TinyLog;

CREATE TABLE test_default_using_alias
(
    what String,
    a String DEFAULT concat(c, ' is great'),
    b String DEFAULT concat(c, ' is fast'),
    c String ALIAS concat(what, 'House')
)
ENGINE = TinyLog;

SELECT
    a,
    b
FROM test_default_using_alias;