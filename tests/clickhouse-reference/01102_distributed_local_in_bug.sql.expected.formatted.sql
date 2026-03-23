-- Tags: distributed
SYSTEM DROP  TABLE IF EXISTS hits;

SYSTEM DROP  TABLE IF EXISTS visits;

SYSTEM DROP  TABLE IF EXISTS hits_layer;

SYSTEM DROP  TABLE IF EXISTS visits_layer;

CREATE TABLE visits
(
    StartDate Date
)
ENGINE = MergeTree
ORDER BY (StartDate);

CREATE TABLE hits
(
    EventDate Date,
    WatchID UInt8
)
ENGINE = MergeTree
ORDER BY (EventDate);

CREATE TABLE visits_layer
(
    StartDate Date
)
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), 'visits');

CREATE TABLE hits_layer
(
    EventDate Date,
    WatchID UInt8
)
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), 'hits');

SET distributed_product_mode = 'local';

SELECT 0
FROM hits_layer AS hl
PREWHERE WatchID IN (
        SELECT 0
        FROM visits_layer AS vl
    )
WHERE 0;

SYSTEM DROP  TABLE hits;

SYSTEM DROP  TABLE visits;

SYSTEM DROP  TABLE hits_layer;

SYSTEM DROP  TABLE visits_layer;