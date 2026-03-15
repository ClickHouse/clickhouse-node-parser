set allow_experimental_variant_type = 1;
set allow_suspicious_types_in_order_by = 1;
CREATE TABLE test(
    key String,
    val Map(String, Variant(String, Int32, DateTime64(3, 'UTC')))
) engine = ReplicatedMergeTree('/clickhouse/tables/{database}/table', '1')
order by key;
SELECT variantElement(arrayJoin(mapValues(val)), 'String') FROM test ORDER BY ALL;
select '---';
SELECT key, arrayJoin(mapValues(val)) FROM test ORDER BY ALL;
