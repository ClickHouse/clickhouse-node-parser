SELECT floor(arrayAUC(array_concat_agg([score]), array_concat_agg([label])), 5)
FROM labels_unordered;

SELECT floor(arrayAUC(array_concat_agg([score]), array_concat_agg([label])), 5)
FROM labels_ordered;