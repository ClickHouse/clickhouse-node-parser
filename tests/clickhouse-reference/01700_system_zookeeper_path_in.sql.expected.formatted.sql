CREATE TABLE sample_table
(
    key UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/01700_system_zookeeper_path_in/{shard}', '{replica}')
ORDER BY tuple();

SELECT name
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard'))
    AND like(name, 'block%')
ORDER BY name ASC;

SELECT 'r1'
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard'), '/replicas')
    AND like(name, concat('%', getMacro('replica'), '%'))
ORDER BY name ASC;

SELECT name
FROM `system`.zookeeper
WHERE path IN (concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard')))
    AND like(name, 'block%')
ORDER BY name ASC;

SELECT 'r1'
FROM `system`.zookeeper
WHERE path IN (concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard'), '/replicas'))
    AND like(name, concat('%', getMacro('replica'), '%'))
ORDER BY name ASC;

SELECT name
FROM `system`.zookeeper
WHERE path IN (concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard')), concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard'), '/replicas'))
    AND like(name, 'block%')
ORDER BY name ASC;

SELECT name
FROM `system`.zookeeper
WHERE path IN (
        SELECT concat(concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard'), '/'), name)
        FROM `system`.zookeeper
        WHERE (name != 'replicas'
            AND notLike(name, 'leader_election%')
            AND notLike(name, 'zero_copy_%')
            AND path = concat('/clickhouse/', currentDatabase(), '/01700_system_zookeeper_path_in/', getMacro('shard')))
    )
ORDER BY name ASC;