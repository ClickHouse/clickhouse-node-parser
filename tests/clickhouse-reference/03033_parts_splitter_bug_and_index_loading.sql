-- the bug happened when we used (a, b) index values for one part and only (a) for another in PartsSplitter. even a simple count query is enough,
-- because some granules were assinged to wrong layers and hence not returned from the reading step (because they were filtered out by `FilterSortedStreamByRange`)
select count() from t where not ignore(*);
