SYSTEM DROP  TABLE IF EXISTS view_without_sample;

CREATE VIEW view_without_sample
AS
SELECT 1 AS x;

SELECT *
FROM merge(currentDatabase(), '^view_without_sample$') SAMPLE 1/100;

SYSTEM DROP  TABLE view_without_sample;