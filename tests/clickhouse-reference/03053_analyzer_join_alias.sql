SELECT
    base.id AS `base.id`,
    derived2.id2 AS `derived2.id2`,
    derived2.value2 AS `derived2.value2`,
    derived1.value1 AS `derived1.value1`
FROM {CLICKHOUSE_DATABASE:Identifier}.base AS base
LEFT JOIN {CLICKHOUSE_DATABASE:Identifier}.derived2 AS derived2 ON base.id2 = derived2.id2
LEFT JOIN {CLICKHOUSE_DATABASE:Identifier}.derived1 AS derived1 ON base.id = derived1.id1;
