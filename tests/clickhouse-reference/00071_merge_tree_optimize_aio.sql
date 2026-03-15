set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE hits_snippet(EventTime DateTime('Asia/Dubai'),  EventDate Date,  CounterID UInt32,  UserID UInt64,  URL String,  Referer String) ENGINE = MergeTree(EventDate, intHash32(UserID), (CounterID, EventDate, intHash32(UserID), EventTime), 8192);
SET min_insert_block_size_rows = 0, min_insert_block_size_bytes = 0;
SET max_block_size = 4096;
SET min_bytes_to_use_direct_io = 8192;
SELECT EventTime, EventDate, CounterID, UserID, URL, Referer FROM hits_snippet ORDER BY EventTime, EventDate, CounterID, UserID, URL, Referer ASC;
