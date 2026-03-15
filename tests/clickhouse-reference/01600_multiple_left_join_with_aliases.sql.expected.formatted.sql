CREATE TABLE base
(
    id UInt64,
    id2 UInt64,
    d UInt64,
    value UInt64
)
ENGINE = MergeTree()
ORDER BY (id, id2, d)
PARTITION BY d;

CREATE TABLE derived1
(
    id1 UInt64,
    d1 UInt64,
    value1 UInt64
)
ENGINE = MergeTree()
ORDER BY (id1, d1)
PARTITION BY d1;

CREATE TABLE derived2
(
    id2 UInt64,
    d2 UInt64,
    value2 UInt64
)
ENGINE = MergeTree()
ORDER BY (id2, d2)
PARTITION BY d2;

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