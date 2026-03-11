SELECT dictGetKeys('colors', 'grp', 'blue') AS keys
FROM numbers(1);
SELECT
    target_category,
    dictGetKeys('dict_products', 'category', target_category) AS product_ids_by_category_before
FROM inputs
ORDER BY target_category, target_brand, target_timezone;
SELECT
    target_category,
    dictGetKeys('dict_products', 'category', target_category) AS product_ids_by_category_after
FROM inputs
ORDER BY target_category, target_brand, target_timezone;
