SYSTEM DROP  TABLE IF EXISTS t;

CREATE OR REPLACE VIEW t (number UInt64)
AS
SELECT number
FROM `system`.numbers;

CREATE OR REPLACE VIEW t
AS
SELECT number + 1 AS next_number
FROM `system`.numbers;

SYSTEM DROP  TABLE t;