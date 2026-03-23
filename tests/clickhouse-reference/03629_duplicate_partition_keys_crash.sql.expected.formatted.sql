-- Test case 1: Duplicate column names in partition expression
CREATE TABLE test_duplicate_partition_keys
(
    c0 String,
    c1 Int32
)
ENGINE = MergeTree()
ORDER BY c0
PARTITION BY (c1, c1, sipHash64(c0));

-- Insert some test data
INSERT INTO test_duplicate_partition_keys;

-- This SELECT should not crash (was causing segfault before fix)
SELECT count()
FROM test_duplicate_partition_keys
WHERE c1 = 1;

-- Test the SELECT with different conditions
SELECT
    c0,
    c1
FROM test_duplicate_partition_keys
WHERE c1 = 2
ORDER BY c0 ASC;

-- Test case 2: More complex duplicate partition expression
CREATE TABLE test_duplicate_partition_keys2
(
    a String,
    b Int32,
    c Int32
)
ENGINE = MergeTree()
ORDER BY a
PARTITION BY (b, c, b, sipHash64(a));

INSERT INTO test_duplicate_partition_keys2;

-- This should also work without crashing
SELECT count()
FROM test_duplicate_partition_keys2
WHERE b = 10;

-- Test case 3: Simple table with duplicate keys in different positions
CREATE TABLE test_triple_duplicate
(
    x UInt32,
    y String
)
ENGINE = MergeTree()
ORDER BY y
PARTITION BY (x, x, x);

INSERT INTO test_triple_duplicate;

-- Test SELECT with triple duplicate partition keys
SELECT count()
FROM test_triple_duplicate
WHERE x = 1;

-- Test case 4: Mixed expression duplicates with date functions
CREATE TABLE test_mixed_duplicates
(
    id Int32,
    name String,
    create_date Date
)
ENGINE = MergeTree()
ORDER BY name
PARTITION BY (id, toYYYYMM(create_date), id, sipHash64(name));

INSERT INTO test_mixed_duplicates;

SELECT count()
FROM test_mixed_duplicates
WHERE id = 1;

-- Test case 5: Different data types with duplicates
CREATE TABLE test_type_duplicates
(
    uint_col UInt32,
    int_col Int64,
    str_col String
)
ENGINE = MergeTree()
ORDER BY str_col
PARTITION BY (uint_col, int_col, uint_col, str_col, uint_col);

INSERT INTO test_type_duplicates;

SELECT count()
FROM test_type_duplicates
WHERE uint_col = 100;

-- Test case 6: Complex hash function duplicates
CREATE TABLE test_hash_duplicates
(
    id UInt64,
    data String
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY (sipHash64(data), cityHash64(data), sipHash64(data));

INSERT INTO test_hash_duplicates;

SELECT count()
FROM test_hash_duplicates
WHERE data = 'sample1';

-- Test case 7: Extreme case - single field repeated many times
CREATE TABLE test_extreme_repeats
(
    x UInt64
)
ENGINE = MergeTree()
ORDER BY x
PARTITION BY (x, x, x, x, x, x);

INSERT INTO test_extreme_repeats;

SELECT count()
FROM test_extreme_repeats
WHERE x = 1;

-- Test case 8: Performance test with moderate data
CREATE TABLE test_performance_duplicates
(
    category UInt32,
    name String
)
ENGINE = MergeTree()
ORDER BY name
PARTITION BY (category, category, category);

INSERT INTO test_performance_duplicates SELECT
    number % 10,
    concat('name', toString(number))
FROM numbers(1000);

SELECT count()
FROM test_performance_duplicates
WHERE category = 5;