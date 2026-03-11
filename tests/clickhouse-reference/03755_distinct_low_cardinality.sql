SELECT
    (SELECT count() FROM (SELECT DISTINCT s FROM distinct_lc_basic))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_basic));
SELECT
    (SELECT arraySort(groupArray(s)) FROM (SELECT DISTINCT s FROM distinct_lc_basic))
    =
    (SELECT arraySort(groupArray(CAST(lc AS String))) FROM (SELECT DISTINCT lc FROM distinct_lc_basic));
SELECT
    (SELECT count() FROM (SELECT DISTINCT s FROM distinct_lc_low_cardinality))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_low_cardinality));
SELECT
    (SELECT arraySort(groupArray(s)) FROM (SELECT DISTINCT s FROM distinct_lc_low_cardinality))
    =
    (SELECT arraySort(groupArray(CAST(lc AS String))) FROM (SELECT DISTINCT lc FROM distinct_lc_low_cardinality));
SELECT
    (SELECT count() FROM (SELECT DISTINCT s FROM distinct_lc_nullable))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_nullable));
SELECT
    (SELECT arraySort(groupArray(s)) FROM (SELECT DISTINCT s FROM distinct_lc_nullable))
    =
    (SELECT arraySort(groupArray(lc)) FROM (SELECT DISTINCT lc FROM distinct_lc_nullable));
SELECT
    (SELECT count() FROM (SELECT DISTINCT lc, 1 FROM distinct_lc_basic))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_basic));
SELECT
    (SELECT count() FROM (SELECT DISTINCT 1, lc FROM distinct_lc_basic))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_basic));
SELECT
    (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_basic SETTINGS max_block_size = 128))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_basic SETTINGS max_block_size = 8192));
SELECT
    (SELECT count() FROM (SELECT DISTINCT s FROM distinct_lc_basic SETTINGS max_block_size = 128))
  - (SELECT count() FROM (SELECT DISTINCT s FROM distinct_lc_basic SETTINGS max_block_size = 8192));
SELECT
    (SELECT count() FROM (SELECT DISTINCT toString(intDiv(number, 7)) AS x FROM numbers(100000)))
  - (SELECT count() FROM (SELECT DISTINCT toLowCardinality(toString(intDiv(number, 7))) AS x FROM numbers(100000)));
SELECT
    (SELECT arraySort(groupArray(x)) FROM (SELECT DISTINCT toString(intDiv(number, 7)) AS x FROM numbers(100000)))
    =
    (SELECT arraySort(groupArray(CAST(x AS String))) FROM (SELECT DISTINCT toLowCardinality(toString(intDiv(number, 7))) AS x FROM numbers(100000)));
SELECT
    (SELECT count() FROM (SELECT DISTINCT k1, k2 FROM distinct_lc_mixed))
  - (SELECT uniqExact(k1, k2) FROM distinct_lc_mixed);
SELECT
    (SELECT count() FROM (SELECT DISTINCT k1 FROM distinct_lc_mixed))
  - (SELECT uniqExact(k1) FROM distinct_lc_mixed);
SELECT
    (SELECT count() FROM (SELECT DISTINCT s FROM distinct_lc_all_same))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_all_same));
SELECT
    (SELECT arraySort(groupArray(s)) FROM (SELECT DISTINCT s FROM distinct_lc_all_same))
    =
    (SELECT arraySort(groupArray(CAST(lc AS String))) FROM (SELECT DISTINCT lc FROM distinct_lc_all_same));
SELECT
    (SELECT count() FROM (SELECT DISTINCT s FROM distinct_lc_sparse_nulls))
  - (SELECT count() FROM (SELECT DISTINCT lc FROM distinct_lc_sparse_nulls));
SELECT
    (SELECT arraySort(groupArray(s)) FROM (SELECT DISTINCT s FROM distinct_lc_sparse_nulls))
    =
    (SELECT arraySort(groupArray(lc)) FROM (SELECT DISTINCT lc FROM distinct_lc_sparse_nulls));
