SELECT
    *,
    dynamicType(n2),
    isDynamicElementInSharedData(n2)
FROM to_table
ORDER BY `ALL` ASC;