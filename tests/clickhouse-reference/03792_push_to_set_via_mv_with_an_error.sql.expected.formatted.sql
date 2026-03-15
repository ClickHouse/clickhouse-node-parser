SET materialized_views_ignore_errors = 1;

-- Catch "WriteBuffer is neither finalized nor canceled when destructor is called. No exceptions in flight are detected."
SET send_logs_level = 'error';

CREATE TABLE tab
(
    c0 Int
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW mv
ENGINE = Set()
AS
(SELECT
    c0,
    throwIf(1)
FROM tab);

CREATE TABLE tab
(
    c0 Int,
    c1 Int
)
ENGINE = Memory;

CREATE MATERIALIZED VIEW mv
ENGINE = Set()
AS
(SELECT c1
FROM tab);