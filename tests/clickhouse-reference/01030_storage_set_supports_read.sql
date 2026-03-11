SELECT * FROM userid_test WHERE userid IN (1, 2, 3);
SELECT * FROM userid_test WHERE toUInt64(1) IN (userid_set);
SELECT * FROM userid_test WHERE userid IN (userid_set);
