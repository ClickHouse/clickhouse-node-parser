SELECT COUNT()
FROM bloom_filter_sizing_pk
WHERE key = 1;

-- Check bloom filter size. According to https://hur.st/bloomfilter/?n=100&p=0.01 for 100 keys it should be less that 200B
SELECT COUNT()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'bloom_filter_sizing_pk'
    AND secondary_indices_uncompressed_bytes > 200
    AND active;

SELECT COUNT()
FROM bloom_filter_sizing_sec
WHERE key1 = 1;

-- Check bloom filter size. According to https://hur.st/bloomfilter/?n=100&p=0.01 for 100 keys it should be less that 200B
SELECT COUNT()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'bloom_filter_sizing_sec'
    AND secondary_indices_uncompressed_bytes > 200
    AND active;