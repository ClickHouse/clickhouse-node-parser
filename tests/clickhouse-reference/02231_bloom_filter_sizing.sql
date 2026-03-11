SELECT COUNT() from bloom_filter_sizing_pk WHERE key = 1;
-- Check bloom filter size. According to https://hur.st/bloomfilter/?n=100&p=0.01 for 100 keys it should be less that 200B
SELECT COUNT() from system.parts where database = currentDatabase() AND table = 'bloom_filter_sizing_pk' and secondary_indices_uncompressed_bytes > 200 and active;
SELECT COUNT() from bloom_filter_sizing_sec WHERE key1 = 1;
-- Check bloom filter size. According to https://hur.st/bloomfilter/?n=100&p=0.01 for 100 keys it should be less that 200B
SELECT COUNT() from system.parts where database = currentDatabase() AND table = 'bloom_filter_sizing_sec' and secondary_indices_uncompressed_bytes > 200 and active;
