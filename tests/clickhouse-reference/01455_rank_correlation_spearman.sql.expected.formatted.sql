-- Tags: no-parallel
CREATE DATABASE IF NOT EXISTS db_01455_rank_correlation;

USE db_01455_rank_correlation;

SYSTEM DROP  TABLE IF EXISTS moons;

SYSTEM DROP  TABLE IF EXISTS circles;

SELECT rankCorr(number, number)
FROM numbers(100);

SELECT rankCorr(number, -1 * CAST(number AS Int64))
FROM numbers(100);

SELECT roundBankers(rankCorr(exp(number), sin(number)), 3)
FROM numbers(100);

CREATE TABLE moons
(
    a Float64,
    b Float64
)
ENGINE = Memory();

INSERT INTO moons;

SELECT roundBankers(rankCorr(a, b), 3)
FROM moons;

CREATE TABLE circles
(
    a Float64,
    b Float64
)
ENGINE = Memory();

INSERT INTO circles;

SELECT roundBankers(rankCorr(a, b), 3)
FROM circles;

SYSTEM DROP  DATABASE IF EXISTS db_01455_rank_correlation;