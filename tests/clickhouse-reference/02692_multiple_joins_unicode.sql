SELECT
    `日期`,
    location.name,
    store.`状态`
FROM sales
LEFT JOIN store ON store.id = `店铺`
LEFT JOIN location ON location.id = `地址`
ORDER BY 1, 2, 3;
