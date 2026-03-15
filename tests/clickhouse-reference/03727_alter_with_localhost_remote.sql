CREATE USER test_03727;
CREATE TABLE normal
(
    n Int32,
    s String
)
ENGINE = MergeTree()
ORDER BY n;
CREATE TABLE secret
(
    s String
)
ENGINE = MergeTree()
ORDER BY s;
