DROP TABLE IF EXISTS testing;
CREATE TABLE testing
(
    a String,
    b String,
    c Int32,
    d Int32,
    e Int32,
    PROJECTION proj_1
    (
        SELECT c ORDER BY d
    ),
    PROJECTION proj_2
    (
        SELECT c ORDER BY e, d
    )
)
ENGINE = MergeTree() PRIMARY KEY (a) SETTINGS min_bytes_for_wide_part = 0;
INSERT INTO testing SELECT number, number, number, number, number%2 FROM numbers(5);
SELECT c FROM testing ORDER BY d;
SELECT c FROM testing ORDER BY e, d;
SELECT * FROM system.mutations WHERE database = currentDatabase() AND table = 'testing' AND not is_done;
-- { echoOff }

DROP TABLE testing;
