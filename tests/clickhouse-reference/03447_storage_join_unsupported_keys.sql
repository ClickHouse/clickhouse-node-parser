SET enable_analyzer = 1;
create table if not exists segmented_ctr_cache
(
    product_id        Int32,
    segment_id        Int32,
    count_in_viewport UInt64,
    count_in_viewed   UInt64
)
    engine = Memory;
CREATE TABLE bookmarks_join
(
  product_id Int32,
  segment_id Int32,
  count_in_bookmark Int32
) ENGINE = Join(ALL, LEFT, product_id, segment_id);
CREATE TABLE cart_join
(
product_id Int32,
segment_id Int32,
count_in_cart Int32
) ENGINE = Join(ALL, LEFT, product_id, segment_id);
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
