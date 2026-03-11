SELECT
    segmented_ctr_cache.product_id,
    segmented_ctr_cache.segment_id,
    count_in_bookmark,
    count_in_cart
FROM segmented_ctr_cache
LEFT JOIN cart_join ON
          cart_join.product_id = segmented_ctr_cache.product_id
      AND cart_join.segment_id = segmented_ctr_cache.segment_id
LEFT JOIN bookmarks_join ON
          bookmarks_join.product_id = segmented_ctr_cache.product_id
      AND bookmarks_join.segment_id = segmented_ctr_cache.segment_id
ORDER BY ALL;
