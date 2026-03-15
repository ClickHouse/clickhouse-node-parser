CREATE TABLE cat_hist
(
    categoryId UUID,
    categoryName String
)
ENGINE = Memory;

CREATE TABLE prod_hist
(
    categoryId UUID,
    productId UUID
)
ENGINE = MergeTree
ORDER BY productId;

CREATE TABLE products_l AS prod_hist
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), prod_hist);

CREATE TABLE products AS prod_hist
ENGINE = Merge(currentDatabase(), '^products_');

SELECT *
FROM
    products AS p
LEFT JOIN cat_hist AS c
    USING (categoryId);

SELECT *
FROM
    products AS p
LEFT JOIN cat_hist AS c
    USING (categoryId);