SYSTEM DROP  TABLE IF EXISTS fx_1m;

SYSTEM DROP  TABLE IF EXISTS fx_5m;

-- create source table
CREATE TABLE fx_1m
(
    symbol LowCardinality(String) CODEC(ZSTD),
    dt_close DateTime64(3, 'UTC') CODEC(DoubleDelta, ZSTD),
    open Float32 CODEC(Delta, ZSTD),
    high Float32 CODEC(Delta, ZSTD),
    low Float32 CODEC(Delta, ZSTD),
    close Float32 CODEC(Delta, ZSTD),
    volume Float32 CODEC(Delta, ZSTD)
)
ENGINE = MergeTree()
ORDER BY (symbol, dt_close)
PARTITION BY toYear(dt_close)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

-- create view using projection
CREATE VIEW fx_5m
AS
SELECT
    symbol,
    toStartOfInterval(dt_close, toIntervalSecond(300)) AS dt_close,
    argMin(open, dt_close) AS open,
    max(high) AS high,
    min(low) AS low,
    argMax(close, dt_close) AS close,
    sum(volume) AS volume
FROM fx_1m
GROUP BY
    symbol,
    dt_close;

-- insert sample data
INSERT INTO fx_1m SELECT
    'EURUSD',
    toDateTime64('2022-12-12 12:00:00', 3, 'UTC') + number,
    number + randCanonical(),
    number + randCanonical(),
    number + randCanonical(),
    number + randCanonical(),
    number + randCanonical()
FROM numbers(1000000);

-- segmentation fault (filter on dt_close column)
SELECT
    dt_close,
    close
FROM fx_5m
WHERE symbol = 'EURUSD'
    AND and(greaterOrEquals(dt_close, '2022-12-11'), lessOrEquals(dt_close, '2022-12-13'))
ORDER BY dt_close ASC
FORMAT Null;

SYSTEM DROP  TABLE fx_5m;

SYSTEM DROP  TABLE fx_1m;