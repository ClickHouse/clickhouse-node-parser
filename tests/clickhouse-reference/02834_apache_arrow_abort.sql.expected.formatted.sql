-- Tags: no-fasttest, no-tsan, no-asan, no-msan, no-ubsan
-- This tests depends on internet access, but it does not matter, because it only has to check that there is no abort due to a bug in Apache Arrow library.
SET optimize_trivial_insert_select = 1;