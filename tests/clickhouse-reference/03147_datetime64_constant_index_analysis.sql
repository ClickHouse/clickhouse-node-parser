SELECT count() FROM test WHERE d <= '2024-01-01 02:03:04';
SELECT count() FROM test WHERE d <= toDateTime('2024-01-01 02:03:04');
SELECT count() FROM test WHERE d <= toDateTime64('2024-01-01 02:03:04', 0);
SELECT count() FROM test WHERE d <= toDateTime64('2024-01-01 02:03:04', 3);
SELECT count() FROM test WHERE d <= '2024-01-02';
SELECT count() FROM test WHERE d <= toDate('2024-01-02');
