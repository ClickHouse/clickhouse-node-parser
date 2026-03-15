CREATE TABLE hits_dst AS test.hits
ENGINE = MergeTree
ORDER BY (CounterID, EventDate, intHash32(UserID))
PARTITION BY toYYYYMM(EventDate)
SAMPLE BY intHash32(UserID)
SETTINGS storage_policy = 'default';

CREATE TABLE hits_buffer AS hits_dst
ENGINE = Buffer(current_database(), hits_dst, 8, 600, 600, 1000000, 1000000, 100000000, 1000000000);

SELECT count()
FROM hits_buffer;

SELECT count()
FROM hits_dst;