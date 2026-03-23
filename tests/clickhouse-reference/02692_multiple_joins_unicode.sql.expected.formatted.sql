SYSTEM DROP  TABLE IF EXISTS store;

SYSTEM DROP  TABLE IF EXISTS location;

SYSTEM DROP  TABLE IF EXISTS sales;

CREATE TABLE store
(
    id UInt32,
    `名称` String,
    `状态` String
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE location
(
    id UInt32,
    name String
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE sales
(
    `日期` Date,
    `店铺` UInt32,
    `地址` UInt32,
    `销售额` Float32
)
ENGINE = MergeTree()
ORDER BY `日期`;

INSERT INTO store;

INSERT INTO location;

INSERT INTO sales;

SELECT
    `日期`,
    location.name,
    store.`状态`
FROM
    sales
LEFT JOIN store
    ON store.id = `店铺`
LEFT JOIN location
    ON location.id = `地址`
ORDER BY
    1 ASC,
    2 ASC,
    3 ASC;

SYSTEM DROP  TABLE store;

SYSTEM DROP  TABLE location;

SYSTEM DROP  TABLE sales;