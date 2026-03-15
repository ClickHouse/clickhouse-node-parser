CREATE TABLE store (id UInt32, "名称" String, "状态" String) ENGINE=MergeTree() Order by id;
CREATE TABLE location (id UInt32, name String) ENGINE=MergeTree() Order by id;
CREATE TABLE sales ("日期" Date, "店铺" UInt32, "地址" UInt32, "销售额" Float32) ENGINE=MergeTree() Order by "日期";
SELECT
    `日期`,
    location.name,
    store.`状态`
FROM sales
LEFT JOIN store ON store.id = `店铺`
LEFT JOIN location ON location.id = `地址`
ORDER BY 1, 2, 3;
