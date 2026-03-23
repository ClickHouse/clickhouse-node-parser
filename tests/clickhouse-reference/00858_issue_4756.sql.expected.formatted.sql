SET enable_analyzer = 1;

SET distributed_product_mode = 'local';

SYSTEM drop  table if exists shard1;

SYSTEM drop  table if exists shard2;

SYSTEM drop  table if exists distr1;

SYSTEM drop  table if exists distr2;

CREATE TABLE shard1
(
    id Int32
)
ENGINE = MergeTree
ORDER BY cityHash64(id);

CREATE TABLE shard2
(
    id Int32
)
ENGINE = MergeTree
ORDER BY cityHash64(id);

CREATE TABLE distr1 AS shard1
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), shard1, cityHash64(id));

CREATE TABLE distr2 AS shard2
ENGINE = Distributed(test_cluster_two_shards_localhost, currentDatabase(), shard2, cityHash64(id));

INSERT INTO shard1 (id);

INSERT INTO shard2 (id);

SELECT DISTINCT (distr1.id)
FROM distr1
WHERE distr1.id IN (
        SELECT distr1.id
        FROM
            distr1
        INNER JOIN distr2
            ON distr1.id = distr2.id
        WHERE distr1.id > 0
    );

SELECT DISTINCT (d0.id)
FROM distr1 AS d0
WHERE d0.id IN (
        SELECT d1.id
        FROM
            distr1 AS d1
        INNER JOIN distr2 AS d2
            ON d1.id = d2.id
        WHERE d1.id > 0
    );

SELECT DISTINCT (distr1.id)
FROM distr1
WHERE distr1.id IN (
        SELECT distr1.id
        FROM
            distr1 AS d1
        INNER JOIN distr2 AS d2
            ON distr1.id = distr2.id
        WHERE distr1.id > 0
    );

SYSTEM drop  table shard1;

SYSTEM drop  table shard2;

SYSTEM drop  table distr1;

SYSTEM drop  table distr2;