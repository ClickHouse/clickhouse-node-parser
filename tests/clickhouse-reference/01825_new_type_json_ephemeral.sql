SET enable_json_type = 1;
CREATE table t_github_json
(
    event_type LowCardinality(String) DEFAULT JSONExtractString(message_raw, 'type'),
    repo_name LowCardinality(String) DEFAULT JSONExtractString(message_raw, 'repo', 'name'),
    message JSON DEFAULT empty(message_raw) ? '{}' : message_raw,
    message_raw String EPHEMERAL
) ENGINE = MergeTree ORDER BY (event_type, repo_name);
