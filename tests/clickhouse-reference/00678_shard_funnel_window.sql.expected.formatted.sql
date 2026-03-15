SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE remote_test
(
    uid String,
    its UInt32,
    action_code String,
    day Date
)
ENGINE = MergeTree(day, (uid, its), 8192);

SELECT
    level,
    COUNT()
FROM (
        SELECT
            uid,
            windowFunnel(3600)(toUInt32(its), action_code != '', action_code = '2') AS level
        FROM remote('127.0.0.{2,3}', currentDatabase(), remote_test)
        GROUP BY uid
    )
GROUP BY level;