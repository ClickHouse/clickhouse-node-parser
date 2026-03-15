SET enable_analyzer = 1;

CREATE TABLE test1
(
    a Int32,
    b Int32,
    a_a Int32 ALIAS a
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE test2
(
    a Int32,
    c Int32,
    a_a Int16 ALIAS a
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT *
FROM merge(currentDatabase(), '^test.*')
ORDER BY `all` ASC;

SELECT
    a,
    b,
    c,
    a_a
FROM merge(currentDatabase(), '^test.*')
ORDER BY `all` ASC;