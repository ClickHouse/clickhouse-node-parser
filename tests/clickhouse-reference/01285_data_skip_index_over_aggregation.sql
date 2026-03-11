SELECT * FROM data_01285;
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 1;
SELECT * FROM data_01285 ORDER BY ALL;
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 1 ORDER BY ALL;
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 3 ORDER BY ALL;
-- before the fix value_idx contains one range {0, 0}
-- and hence cannot find these record.
SELECT * FROM data_01285 WHERE assumeNotNull(value) = 3;
