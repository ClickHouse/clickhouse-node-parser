SYSTEM DROP  TABLE IF EXISTS 02834_t;

CREATE TABLE `02834_t`
(
    id UInt64,
    arr Array(UInt64)
)
ENGINE = MergeTree
ORDER BY id;

SET enable_analyzer = 0;

SET enable_analyzer = 1;

INSERT INTO `02834_t`;

SYSTEM DROP  TABLE 02834_t;