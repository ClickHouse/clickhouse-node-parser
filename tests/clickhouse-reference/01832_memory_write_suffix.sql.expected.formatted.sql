SYSTEM drop  table if exists data_01832;

-- Memory writes from the writeSuffix() and if it will be called twice two rows
-- will be written (since it does not reset the block).
CREATE TABLE data_01832
(
    key Int
)
ENGINE = Memory;

INSERT INTO data_01832;

SELECT *
FROM data_01832;

SYSTEM drop  table data_01832;