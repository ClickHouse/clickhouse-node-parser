CREATE TABLE hits_none (Title String CODEC(NONE)) ENGINE = MergeTree ORDER BY tuple() SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
SET min_bytes_to_use_mmap_io = 1;
SELECT sum(length(Title)) FROM hits_none;
