SET flatten_nested = 1;

CREATE TABLE `02500_nested`
(
    nes Nested(a Int32, b Int32)
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE `02500_nested`
(
    nes Nested(a Int32, b Int32),
    z Int32
)
ENGINE = MergeTree
ORDER BY tuple();

SET flatten_nested = 0;

CREATE TABLE `02500_nested`
(
    nes Array(Tuple(a Int32, b Int32)),
    z Int32
)
ENGINE = MergeTree
ORDER BY tuple();