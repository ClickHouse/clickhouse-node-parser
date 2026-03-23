CREATE TABLE tuple_01016
(
    a Tuple(DateTime, Int32)
)
ENGINE = MergeTree()
ORDER BY a;

-- repeat a couple of times, because it doesn't always reproduce well
INSERT INTO tuple_01016;

SELECT *
FROM tuple_01016
WHERE a < tuple(toDateTime('2019-01-01 00:00:00'), 0)
FORMAT Null;