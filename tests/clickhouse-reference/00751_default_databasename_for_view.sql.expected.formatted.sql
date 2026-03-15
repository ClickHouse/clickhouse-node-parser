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

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.t_00751
ORDER BY date ASC;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.t_mv_00751
ORDER BY date ASC;