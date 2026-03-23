-- Tags: no-shared-catalog
-- no-shared-catalog: standard MergeTree is not supported
DROP TABLE IF EXISTS trunc;

SET default_table_engine = 'ReplicatedMergeTree';

CREATE TABLE trunc
(
    n int,
    PRIMARY KEY(n)
)
ENGINE = ReplicatedMergeTree('/test/1166/{database}', '1')
PARTITION BY n % 10;

INSERT INTO trunc SELECT *
FROM numbers(20);

SELECT
    count(),
    sum(n)
FROM trunc;

DROP TABLE trunc;

SET default_table_engine = 'MergeTree';

CREATE TABLE trunc
(
    n int,
    PRIMARY KEY(n)
)
PARTITION BY n % 10;