CREATE TABLE most_ordinary_mt
(
   Key UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();
