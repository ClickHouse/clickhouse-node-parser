SET enable_json_type = 1;

CREATE TABLE t_github_json
(
    event_type LowCardinality(String) DEFAULT JSONExtractString(message_raw, 'type'),
    repo_name LowCardinality(String) DEFAULT JSONExtractString(message_raw, 'repo', 'name'),
    message JSON DEFAULT if(empty(message_raw), '{}', message_raw),
    message_raw String EPHEMERAL
)
ENGINE = MergeTree
ORDER BY (event_type, repo_name);

INSERT INTO t_github_json (message_raw);