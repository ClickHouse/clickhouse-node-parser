CREATE TABLE insert_dedup_token (
    id Int32, val UInt32
) ENGINE=MergeTree() ORDER BY id
SETTINGS non_replicated_deduplication_window=0xFFFFFFFF;
SELECT * FROM insert_dedup_token ORDER BY id;
set insert_deduplication_token = '\x61\x00\x62';
set insert_deduplication_token = '\x61\x00\x63';
set insert_deduplication_token = '';
