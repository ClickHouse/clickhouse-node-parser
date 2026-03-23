CREATE TABLE tab
(
    id Int32,
    vec Array(Float32),
    INDEX idx vec TYPE vector_similarity('hnsw', 'L2Distance', 2)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 8192;

-- Generate random values but with a fixed seed (conceptually), so that the data is deterministic.
-- Unfortunately, no random functions in ClickHouse accepts a seed. Instead, abuse the numbers table + hash functions to provide
-- deterministic randomness.
INSERT INTO tab SELECT
    number,
    [sipHash64(number)/18446744073709551615, wyHash64(number)/18446744073709551615]
FROM numbers(660000); -- 18446744073709551615 is the biggest UInt64

CREATE TABLE results
(
    id Int32
)
ENGINE = Memory;

-- Standard vector search with default hnsw_candidate_list_size_for_search = 64
INSERT INTO results SELECT id
FROM tab
ORDER BY L2Distance(vec, [0.5, 0.5]) ASC
LIMIT 1;

-- Vector search with custom hnsw_candidate_list_size_for_search
INSERT INTO results SELECT id
FROM tab
ORDER BY L2Distance(vec, [0.5, 0.5]) ASC
LIMIT 1
SETTINGS hnsw_candidate_list_size_for_search = 1;

-- Expect that matches are different
SELECT countDistinct(*)
FROM results;