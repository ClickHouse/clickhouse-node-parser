-- Tags: no-fasttest

SELECT h3ToChildren(599405990164561919, 16); -- { serverError ARGUMENT_OUT_OF_BOUND }
CREATE TABLE h3_indexes (h3_index UInt64, res UInt8) ENGINE = Memory;
SELECT arraySort(h3ToChildren(h3_index,res)) FROM h3_indexes ORDER BY res;
