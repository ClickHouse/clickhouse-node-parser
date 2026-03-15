set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE partitions (EventDate Date, CounterID UInt32) ENGINE = MergeTree(EventDate, CounterID, 8192);
SELECT count() FROM partitions;
SELECT count() FROM partitions WHERE EventDate >= toDate('2015-01-01') AND EventDate < toDate('2015-02-01');
SELECT count() FROM partitions WHERE EventDate < toDate('2015-01-01') OR EventDate >= toDate('2015-02-01');
