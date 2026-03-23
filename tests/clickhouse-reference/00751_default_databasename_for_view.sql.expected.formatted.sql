DROP TABLE IF EXISTS t_00751;

DROP TABLE IF EXISTS t_mv_00751;

DROP TABLE IF EXISTS u_00751;

DROP TABLE IF EXISTS v_00751;

CREATE TABLE t_00751
(
    date Date,
    platform Enum8('a' = 0, 'b' = 1),
    app Enum8('a' = 0, 'b' = 1)
)
ENGINE = Memory;

CREATE TABLE u_00751
(
    app Enum8('a' = 0, 'b' = 1)
)
ENGINE = Memory;

CREATE TABLE v_00751
(
    platform Enum8('a' = 0, 'b' = 1)
)
ENGINE = Memory;

INSERT INTO u_00751;

INSERT INTO v_00751;

CREATE MATERIALIZED VIEW t_mv_00751
ENGINE = MergeTree
ORDER BY date
AS
SELECT
    date,
    platform,
    app
FROM t_00751
WHERE app = (
        SELECT min(app)
        FROM u_00751
    )
    AND platform = (
        SELECT (
                SELECT min(platform)
                FROM v_00751
            )
    );

USE default;

INSERT INTO {CLICKHOUSE_DATABASE:Identifier}.t_00751;

INSERT INTO {CLICKHOUSE_DATABASE:Identifier}.u_00751;

INSERT INTO {CLICKHOUSE_DATABASE:Identifier}.v_00751;

INSERT INTO {CLICKHOUSE_DATABASE:Identifier}.t_00751;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.t_00751
ORDER BY date ASC;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.t_mv_00751
ORDER BY date ASC;

DROP TABLE {CLICKHOUSE_DATABASE:Identifier}.t_00751;

DROP TABLE {CLICKHOUSE_DATABASE:Identifier}.t_mv_00751;

DROP TABLE {CLICKHOUSE_DATABASE:Identifier}.u_00751;

DROP TABLE {CLICKHOUSE_DATABASE:Identifier}.v_00751;