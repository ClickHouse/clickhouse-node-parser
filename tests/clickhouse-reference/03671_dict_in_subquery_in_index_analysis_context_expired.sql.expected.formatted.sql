-- Tags: no-parallel-replicas
SYSTEM DROP  DICTIONARY IF EXISTS dict;

SYSTEM DROP  TABLE IF EXISTS info;

SYSTEM DROP  TABLE IF EXISTS ids;

CREATE TABLE info
(
    iid UInt32
)
ENGINE = MergeTree()
ORDER BY iid;

INSERT INTO info (iid);

CREATE TABLE ids
(
    id Int64
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO ids (id);

CREATE DICTIONARY dict
(
    id Int64,
    children Array(Int64)
)
PRIMARY KEY id
SOURCE(clickhouse(QUERY 'SELECT 1 id, [1] children'))
LAYOUT(DIRECT());

SELECT iid IN (
        SELECT DISTINCT arrayJoin(dictGet(dict, 'children', id))
        FROM ids
    )
FROM (
        SELECT *
        FROM info
        WHERE (iid IN (
                SELECT DISTINCT arrayJoin(dictGet(dict, 'children', id))
                FROM ids
            ))
    );