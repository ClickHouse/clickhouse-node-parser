CREATE TABLE test_null_as_default (a String DEFAULT 'WORLD') ENGINE = Memory;
SELECT * FROM test_null_as_default ORDER BY a;
CREATE TABLE test_null_as_default (a String DEFAULT 'WORLD', b String DEFAULT 'PEOPLE') ENGINE = Memory;
CREATE TABLE test_null_as_default (a Int8, b Int64 DEFAULT a + 1000) ENGINE = Memory;
CREATE TABLE test_null_as_default (a Int8, b Int64 DEFAULT c - 500, c Int32 DEFAULT a + 1000) ENGINE = Memory;
