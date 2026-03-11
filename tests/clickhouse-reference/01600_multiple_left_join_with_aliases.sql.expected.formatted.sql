SELECT
    base.id AS `base.id`,
    derived2.value2 AS `derived2.value2`,
    derived1.value1 AS `derived1.value1`
FROM
    base AS base
LEFT JOIN derived2 AS derived2
    ON base.id2 = derived2.id2
LEFT JOIN derived1 AS derived1
    ON base.id = derived1.id1;

SELECT
    base.id AS `base.id`,
    derived1.value1 AS `derived1.value1`
FROM
    base AS base
LEFT JOIN derived1 AS derived1
    ON base.id = derived1.id1;