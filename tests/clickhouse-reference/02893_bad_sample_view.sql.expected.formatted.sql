CREATE VIEW view_without_sample
AS
SELECT 1 AS x;

SELECT *
FROM merge(currentDatabase(), '^view_without_sample$') SAMPLE 1/100;