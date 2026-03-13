SELECT
    engine,
    is_external
FROM `system`.databases
WHERE name = {CLICKHOUSE_DATABASE_1:String};