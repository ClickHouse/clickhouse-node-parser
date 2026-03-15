CREATE TABLE trailing_comma_1
(
    id INT NOT NULL DEFAULT 1
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE trailing_comma_2
(
    id INT DEFAULT 1
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE trailing_comma_3
(
    x UInt8,
    y UInt8
)
ENGINE = MergeTree()
ORDER BY tuple();