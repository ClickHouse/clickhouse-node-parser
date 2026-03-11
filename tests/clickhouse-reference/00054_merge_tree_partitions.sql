SELECT count() FROM partitions;
SELECT count() FROM partitions WHERE EventDate >= toDate('2015-01-01') AND EventDate < toDate('2015-02-01');
SELECT count() FROM partitions WHERE EventDate < toDate('2015-01-01') OR EventDate >= toDate('2015-02-01');
