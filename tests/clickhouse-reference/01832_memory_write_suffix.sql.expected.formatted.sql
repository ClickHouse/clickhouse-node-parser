-- Memory writes from the writeSuffix() and if it will be called twice two rows
-- will be written (since it does not reset the block).
CREATE TABLE data_01832
(
    key Int
)
ENGINE = Memory;

SELECT *
FROM data_01832;