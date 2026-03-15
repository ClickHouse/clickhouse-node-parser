CREATE TABLE merge_a
(
    x UInt8
)
ENGINE = StripeLog;

CREATE TABLE merge_b
(
    x UInt8
)
ENGINE = StripeLog;

CREATE TABLE merge_ab AS merge(currentDatabase(), '^merge_[ab]$');

SELECT name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'merge_ab';